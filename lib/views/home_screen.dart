import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pop_corn_flix/models/MovieModel.dart';
import 'package:pop_corn_flix/notifiers/movie_controller.dart';
import 'package:get/get.dart';
import 'package:pop_corn_flix/views/fav_movies.dart';
import '../models/genres/Genres.dart';
import 'details_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var counter = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(() {
    //    if(_scrollController.position.maxScrollExtent == _scrollController.position.pixels){
    //       setState(() {
    //         counter++;
    //
    //       });
    //    }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("assets/icons/list.png",height: 30,width: 30,),
                  const Expanded(
                    child: Text("FilmKu",style: TextStyle(fontFamily: 'merriweather',
                        color: Color(0xFF110E47)),textAlign: TextAlign.center,),
                  ),
                  IconButton(
                      onPressed: (){
                        Get.to(() => const FavMoviesScreen());
                      },
                      icon: const Icon(Icons.star_rate_outlined,color: Colors.orange,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Now Showing",style: TextStyle(fontFamily: 'merriweather',fontSize: 20,
                      color: Color(0xFF110E47)),),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(color: Colors.black54,spreadRadius: 0.5)
                        ]
                    ),
                    child: const Text("see more",style: TextStyle(color: Color(0xFF110E47),fontSize: 10,
                        fontFamily: 'mulish_regular'),),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              height: 300,
              child: Consumer(
                builder: (context,ref,_){
                  var nowShowingMovies = ref.watch(MovieController.nowShowingProvider).value;
                  if(nowShowingMovies != null){
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: nowShowingMovies.results!.length,
                      itemBuilder: (context,index){
                        var finalResult = nowShowingMovies.results;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                elevation: 6,
                                shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                clipBehavior: Clip.antiAlias,
                                child: ClipRRect(
                                  borderRadius : BorderRadius.circular(8),
                                  child: Material(
                                    child: Image.network("http://image.tmdb.org/t/p/w500/${finalResult![index].posterPath!}",
                                      height: 200,width : 150 ,fit: BoxFit.cover,),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 4,right: 4),
                                  child: Text(finalResult[index].title!,style: const TextStyle(fontFamily: 'mulish_bold',
                                      fontWeight: FontWeight.bold),),
                                ),),
                              const SizedBox(height: 5,),
                              SizedBox(
                                width: 150,
                                child: Row(
                                  children: [
                                    Image.asset("assets/icons/rating.png",height: 20,width: 20,),
                                    Expanded(child: Text("${finalResult[index].voteAverage}/10 Imdb",style: const TextStyle(fontFamily: 'mulish_regular',
                                        color: Color(0xFF9C9C9C)),))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.orange,),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Popular",style: TextStyle(fontFamily: 'merriweather',fontSize: 20,
                      color: Color(0xFF110E47)),),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(color: Colors.black54,spreadRadius: 0.5)
                        ]
                    ),
                    child: const Text("see more",style: TextStyle(color: Color(0xFF110E47),fontSize: 10,
                        fontFamily: 'mulish_regular'),),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Consumer(
                builder: (context,ref,_){
                  var popularMovies = ref.watch(MovieController.popularMoviesProvider(counter)).value;
                  if(popularMovies != null){
                    return ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      itemCount: popularMovies.results!.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Get.to(() => const DetailsScreen(),
                                arguments: [
                                  {"movieId" : popularMovies.results![index].id}
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
                                      child: Image.network("http://image.tmdb.org/t/p/w500/${popularMovies.results![index].backdropPath}",
                                        height: 170,width : 120 ,fit: BoxFit.cover,),
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
                                          child: Text(popularMovies.results![index].title!,style: const TextStyle(
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
                                              Expanded(child: Text("${popularMovies.results![index].voteAverage}/10 Imdb",style: const TextStyle(fontFamily: 'mulish_regular',
                                                  color: Color(0xFF9C9C9C)),))
                                            ],
                                          ),

                                        ),
                                        const SizedBox(height: 10,),
                                        Consumer(
                                          builder: (context,ref,_){
                                            var genres = ref.watch(MovieController.moviesGenreProvider).value;
                                            if(genres != null){
                                              return showGenres(index,genres.genres,popularMovies);
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
                                            child: Text(popularMovies.results![index].releaseDate!,style: const TextStyle(fontFamily: 'mulish_regular',
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
                    );
                  }
                  else {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.orange,),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showGenres(index,List<Genres>? genres, MovieModel movies) {
    var emptyList = [];
    for (var genre in genres!) {
      movies.results![index].genreIds?.forEach((genre2) {
        if(genre.id! == genre2){
          emptyList.add(genre.name!);
        }
      });
    }

    return SizedBox(
      height: 30,
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
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
      ),
    );
  }
}



