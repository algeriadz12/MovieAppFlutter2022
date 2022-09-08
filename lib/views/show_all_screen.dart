import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/MovieModel.dart';
import '../models/Results.dart';
import '../models/genres/Genres.dart';
import '../notifiers/movie_controller.dart';
import '../utils.dart';
import 'details_screen.dart';

class ShowAllScreen extends StatefulWidget {
  const ShowAllScreen({Key? key}) : super(key: key);

  @override
  State<ShowAllScreen> createState() => _ShowAllScreenState();
}

class _ShowAllScreenState extends State<ShowAllScreen> {
  String type = '';
  bool isProgressLoading = false;
  List<Results>? popularMoviesList  = [];
  var hasNextPage = 2;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          isProgressLoading = true;
        });
        if(type == "NowShowing"){
          _loadMoreShowing(hasNextPage);
        } else if (type == "popular"){
          _loadMorePopular(hasNextPage);
        }
      }
    });

    type = Get.arguments["type"];
  }

  _loadMorePopular(int page) async {
    var response = await http.get(Uri.parse("${Utils.popularMoviesUrl}&page=$page"));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      if(MovieModel.fromJson(json).results != null){
        hasNextPage += 1;
        setState(() {
          isProgressLoading = false;
          popularMoviesList!.addAll(MovieModel.fromJson(json).results!);
        });
      }
    }
  }
  _loadMoreShowing(int page) async {
    var response = await http.get(Uri.parse("${Utils.nowShowingUrl}&page=$page"));
    if(response.statusCode == 200){
      var json  = jsonDecode(response.body);
      if(MovieModel.fromJson(json).results != null){
        hasNextPage += 1;
        setState(() {
          isProgressLoading = false;
          popularMoviesList!.addAll(MovieModel.fromJson(json).results!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (type == "NowShowing") const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Now Showing",style: TextStyle(fontFamily: 'mulish_bold',fontSize: 20),),
            ) else const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Popular",style: TextStyle(fontFamily: 'mulish_bold',fontSize: 20),),
            ),
            Expanded(
              child: Consumer(
                builder: (context,ref,_){
                  if(type == "NowShowing"){
                    if(ref.watch(MovieController.nowShowingProvider(1)).value != null
                        && ref.watch(MovieController.nowShowingProvider(1)).value?.results != null){
                      popularMoviesList = ref.watch(MovieController.nowShowingProvider(1)).value?.results;
                    }
                  } else if (type == "popular"){
                    if(ref.watch(MovieController.popularMoviesProvider(1)).value != null
                        && ref.watch(MovieController.popularMoviesProvider(1)).value?.results != null){
                      popularMoviesList = ref.watch(MovieController.popularMoviesProvider(1)).value?.results;
                    }
                  }
                  return  Column(
                    children: [
                      Expanded(child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: popularMoviesList!.length,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              Get.to(() =>  const DetailsScreen(),
                                  arguments: [
                                    {"movieId" : popularMoviesList![index].id}
                                  ]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Material(
                                    elevation: 4,
                                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    clipBehavior: Clip.antiAlias,
                                    child: ClipRRect(
                                      borderRadius : BorderRadius.circular(8),
                                      child: Material(
                                        child: popularMoviesList![index].backdropPath != null ?
                                        Image.network("http://image.tmdb.org/t/p/w500/${popularMoviesList![index].backdropPath}",
                                          height: 170,width : 120 ,fit: BoxFit.cover,) :
                                        Image.asset("assets/images/error_image.png", height: 170,width : 120 ,fit: BoxFit.cover,),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width : 250,
                                            child: Text(popularMoviesList![index].title!,style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'mulish_bold'
                                            ),maxLines: 2,),
                                          ),
                                          const SizedBox(height: 10,),
                                          SizedBox(
                                            width: 150,
                                            child: Row(
                                              children: [
                                                Image.asset("assets/icons/rating.png",height: 20,width: 20,),
                                                Expanded(child: Text("${popularMoviesList![index].voteAverage}/10 Imdb",style: const TextStyle(fontFamily: 'mulish_regular',
                                                    color: Color(0xFF9C9C9C)),))
                                              ],
                                            ),

                                          ),
                                          const SizedBox(height: 10,),
                                          Consumer(
                                            builder: (context,ref,_){
                                              var genres = ref.watch(MovieController.moviesGenreProvider).value;
                                              if(genres != null){
                                                return showGenres(index,genres.genres,popularMoviesList);
                                              } else {
                                                return const Center(
                                                  child: SizedBox(
                                                    height: 2,
                                                    width: 100,
                                                    child: LinearProgressIndicator(
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          const SizedBox(height: 10,),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            color: Colors.green.shade400,
                                            child :  Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(popularMoviesList![index].releaseDate!,style: const TextStyle(fontFamily: 'mulish_regular',
                                                  color: Colors.white,fontSize: 13),),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                      Visibility(
                        visible : isProgressLoading,
                        child:  const Align(
                          alignment: Alignment.bottomCenter,
                          child:  Padding(
                            padding: EdgeInsets.only(top: 2,bottom: 2),
                            child: CircularProgressIndicator(color: Colors.deepOrange,),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showGenres(index,List<Genres>? genres, List<Results>? movies) {
    var emptyList = [];
    for (var genre in genres!) {
      movies![index].genreIds?.forEach((genre2) {
        if(genre.id! == genre2){
          emptyList.add(genre.name!);
        }
      });
    }

    return SizedBox(
      height: 30,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: emptyList.length,
        itemBuilder: (context,position){
          return Card(
            color: const Color(0xFF88A4E8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: Text(emptyList[position],style: const TextStyle(color: Colors.white,
                  fontFamily: 'mulish_bold'),),
            ),
          );
        },
      ),
    );
  }
}
