

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pop_corn_flix/models/MovieModel.dart';
import 'package:pop_corn_flix/models/cast/CastModel.dart';
import 'package:pop_corn_flix/models/details/DetailsModel.dart';
import 'package:pop_corn_flix/models/genres/MovieGenre.dart';
import 'package:pop_corn_flix/models/type/video_type.dart';
import 'package:pop_corn_flix/models/videos/VideoModel.dart';
import 'package:pop_corn_flix/service/auth_service.dart';

import '../models/videos/Results.dart';

class MovieController extends ChangeNotifier {
   static List<Results>? list = [];
   static AuthService authService  = AuthService();



   static getMoviesGenre() {
     return authService.getMovieGenre();
   }

   static getMovieDetails(int id) {
     return authService.getMovieDetails(id);
   }

   static var nowShowingProvider = FutureProvider.family<MovieModel?,int>((ref,page){
     return authService.getNowShowing(page);
   });

   static var popularMoviesProvider = FutureProvider.family<MovieModel?,int>((ref,page){
     return authService.getPopularMovies(page);
   });

   static var moviesGenreProvider = FutureProvider<MovieGenre?>((ref){
     return getMoviesGenre();
   });

   static var movieDetailsProvider = FutureProvider.family<DetailsModel?,int>((ref,movieId){
     return authService.getMovieDetails(movieId);
   });

   static var movieCastingProvider = FutureProvider.family<CastModel?,int>((ref,movieId){
     return authService.getMovieCasting(movieId);
   });

   // get data
   static var movieVideosProvider = FutureProvider.family<List<Results>?,VideoType>((ref,videoType)  {
      authService.getMovieVideos(videoType.movieId).then((value){
        list = value!.results!;
      });
      return list!.where((element) => element.type == videoType.videoType).toList();
   });

}