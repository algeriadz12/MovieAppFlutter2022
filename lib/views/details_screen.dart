import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pop_corn_flix/models/genres/MovieGenre.dart';
import 'package:pop_corn_flix/moor/moor_helper.dart';
import 'package:pop_corn_flix/movie_state.dart';
import 'package:pop_corn_flix/notifiers/movie_controller.dart';
import 'package:pop_corn_flix/notifiers/movie_notifier.dart';
import 'package:pop_corn_flix/views/home_screen.dart';
import 'package:pop_corn_flix/views/videos_screen.dart';

import '../models/details/Genres.dart';
//bookmark_border
final moviesProvider  = StateNotifierProvider((ref) =>  MovieNotifier());

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var bookmark = Icons.bookmark_border;
  bool isMovieFound = false;
  int movieId = 0;
  @override
  void initState() {
    super.initState();
     movieId = Get.arguments[0]['movieId'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Consumer(
        builder: (context , ref , _){
          var genres = ref.watch(MovieController.moviesGenreProvider).value;
          var movieDetails = ref.watch(MovieController.movieDetailsProvider(movieId)).value;
          var movieCasting = ref.watch(MovieController.movieCastingProvider(movieId)).value;
          var provider = ref.watch(moviesProvider.notifier);
          var providerState = ref.watch(moviesProvider.notifier).state;
          if(genres != null &&  movieDetails != null &&  movieCasting != null ){
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Stack(
                      children: [
                        Image.network("http://image.tmdb.org/t/p/w500/${movieDetails.posterPath!}",
                          width: double.infinity,fit: BoxFit.cover,),
                        Positioned(
                          top: 40,
                          left: 20,
                          child: GestureDetector(
                            onTap: (){
                              Get.off(() => const HomeScreen());
                            },
                            child: Image.asset("assets/icons/back_arrow.png",height: 30,width: 30,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Text(movieDetails.title!,style: const TextStyle(fontSize: 18,fontFamily: 'mulish_bold'),),
                              ),
                              IconButton(
                                  onPressed: (){
                                    ref.read(moviesProvider.notifier).writeData(MovieData(
                                        rowID: movieId,
                                        title: movieDetails.title!,
                                        posterUrl: "http://image.tmdb.org/t/p/w500/${movieDetails.posterPath!}",
                                        rating: movieDetails.voteAverage.toString(),
                                        releaseDate : movieDetails.releaseDate!,
                                        movieId: movieDetails.id!));
                                    Fluttertoast.showToast(msg: "Movie Successfully Saved..");
                                  },
                                  icon: Icon(bookmark,size: 25,color: Colors.black)),
                              IconButton(
                                  onPressed: (){
                                    Map<String,dynamic> params =
                                    {
                                      'title': movieDetails.title,
                                      'movieId': movieId,
                                    };
                                    Get.to(() => const VideoScreen(),arguments: params);

                                  },
                                  icon: Image.asset("assets/icons/youtube.png"))
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              Image.asset("assets/icons/rating.png",height: 20,width: 20,),
                              Expanded(child: Text("${movieDetails.voteAverage}/10 Imdb",style: const TextStyle(fontFamily: 'mulish_regular',
                                  color: Color(0xFF9C9C9C),fontSize: 16),))
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        showGenres(genres, movieDetails.genres),
                        const SizedBox(height: 15,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Length",style: TextStyle(color: Color(0xFF9C9C9C),fontFamily: 'mulish_regular'),),
                                  Text("Language",style: TextStyle(color: Color(0xFF9C9C9C),fontFamily: 'mulish_regular'),),
                                  Text("Rating",style: TextStyle(color: Color(0xFF9C9C9C),fontFamily: 'mulish_regular'),)
                                ],
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${movieDetails.runtime} min",style: const TextStyle(color: Colors.black,fontFamily: 'mulish_semi_bold'),),
                                  Text(movieDetails.originalLanguage!,style: const TextStyle(color: Colors.black, fontFamily: 'mulish_semi_bold'),),
                                  const Text("Rating",style: TextStyle(color: Colors.black,fontFamily: 'mulish_semi_bold'),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        const Text("Description",style: TextStyle(fontFamily: 'merriweather',fontSize: 20, color: Color(0xFF110E47)),),
                        const SizedBox(height: 5,),
                        Text(movieDetails.overview!,style: const TextStyle(fontFamily: 'mulish_regular',color: Color(0xFF9C9C9C)),),
                        const SizedBox(height: 20,),
                        const Text("Production Companies",style: TextStyle(fontFamily: 'merriweather',fontSize: 17,
                            color: Color(0xFF110E47)),),
                        SizedBox(
                          height: 100,
                          width: double.infinity,
                          child:  ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movieDetails.productionCompanies!.length,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(right: 10,left: 10),
                                child : movieDetails.productionCompanies![index].logoPath != null ?
                                ClipRRect(
                                  child: Image.network("http://image.tmdb.org/t/p/w500/${movieDetails.productionCompanies![index].logoPath}",
                                    height: 50,width: 50,),
                                ) :
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset("assets/images/error_image.png" ,
                                    height: 100,width: 80,fit: BoxFit.contain,),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Cast",style: TextStyle(fontFamily: 'merriweather',fontSize: 17,
                            color: Color(0xFF110E47)),),
                        const SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movieCasting.cast!.length,
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      movieCasting.cast![index].profilePath != null ?
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network("http://image.tmdb.org/t/p/w500/${movieCasting.cast![index].profilePath}",
                                          height: 100,width: 80,fit: BoxFit.cover,),
                                      ) :
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset("assets/images/error_image.png" ,
                                          height: 100,width: 80,fit: BoxFit.contain,),
                                      ),
                                      SizedBox(
                                        width : 80,
                                        child: Text(movieCasting.cast![index].name!,textAlign: TextAlign.center,
                                          style: const TextStyle(fontFamily: 'mulish_regular',color: Color(0xFF110E47)),maxLines: 2,
                                          overflow: TextOverflow.ellipsis,),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.orange,),
            );
          }
        },
      )
    );
  }

  Widget showGenres(MovieGenre? genres, List<Genres>? movies) {
    var emptyList = [];
    for (var genre in genres!.genres!) {
      for (var genre2 in movies!) {
        if(genre.id! == genre2.id){
          emptyList.add(genre.name!);
        }
      }
    }

    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: emptyList.length,
        itemBuilder: (context,position){
          return Card(
            color: const Color(0xFF88A4E8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
              child: Text(emptyList[position],style: const TextStyle(color: Colors.white,
                  fontFamily: 'mulish_bold'),),
            ),
          );
        },
      ),
    );
  }
}
