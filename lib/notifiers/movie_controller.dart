

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pop_corn_flix/models/MovieModel.dart';
import 'package:pop_corn_flix/models/cast/CastModel.dart';
import 'package:pop_corn_flix/models/details/DetailsModel.dart';
import 'package:pop_corn_flix/models/genres/MovieGenre.dart';
import 'package:pop_corn_flix/service/auth_service.dart';

class MovieController extends ChangeNotifier {

   static AuthService authService  = AuthService();

   static getNowShowing() {
       return authService.getNowShowing();
   }

   static getPopularMovies() {
     return authService.getPopularMovies();
   }

   static getMoviesGenre() {
     return authService.getMovieGenre();
   }

   static getMovieDetails(int id) {
     return authService.getMovieDetails(id);
   }

   static var nowShowingProvider = FutureProvider<MovieModel?>((ref){
     return getNowShowing();
   });

   static var popularMoviesProvider = FutureProvider<MovieModel?>((ref){
     return getPopularMovies();
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
}