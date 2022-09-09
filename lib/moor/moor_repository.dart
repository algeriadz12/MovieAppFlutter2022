
import 'package:flutter/material.dart';
import 'package:pop_corn_flix/moor/moor_helper.dart';

class Repository {

   final MyDatabase _instance = MyDatabase();

   Future<List<MovieData>> getMovies() async => await _instance.getMovies();
   Stream<List<MovieData>> watchMovies()  =>  _instance.watchMovies();
   Future<int> insertMovie(MovieData movieData) async => await _instance.insert(movieData);
   Future deleteMovie(MovieData movieData) async => await _instance.deleteMovie(movieData);
   Future deleteAllMovies() async => await _instance.deleteAllMovies();
 }

