

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pop_corn_flix/moor/moor_helper.dart';
import 'package:pop_corn_flix/moor/moor_repository.dart';
import 'package:pop_corn_flix/movie_state.dart';

class MovieNotifier extends StateNotifier<MovieState> {

  MovieNotifier() : super(const MovieState()) {
    readData();
  }

   final Repository _repository = Repository();

   void writeData(MovieData movieData) async {
     state = state.copyWith(isLoading : true);
    await _repository.insertMovie(movieData);
    readData();
  }

  void deleteMovie(MovieData movieData) async {
    state = state.copyWith(isLoading : true);
    await _repository.deleteMovie(movieData);
    readData();
  }

  void deleteAllMovies() async {
    state = state.copyWith(isLoading : true);
    await _repository.deleteAllMovies();
    readData();
  }

  void readData() async {
    state = state.copyWith(isLoading : true);
    final movies = await _repository.getMovies();
    state = state.copyWith(
      isLoading : false,
      isReadyData: true,
      movies: movies
    );
  }

}