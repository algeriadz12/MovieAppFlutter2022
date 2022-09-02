
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pop_corn_flix/models/cast/CastModel.dart';
import 'package:pop_corn_flix/models/details/DetailsModel.dart';
import 'package:pop_corn_flix/models/genres/MovieGenre.dart';
import 'package:pop_corn_flix/utils.dart';
import '../models/MovieModel.dart';

class AuthService {
  
  Future<MovieModel?> getNowShowing() async {
     var response = await http.get(Uri.parse(Utils.nowShowingUrl));
     if(response.statusCode == 200){
       var json = jsonDecode(response.body);
       return MovieModel.fromJson(json);
     } else {
       return null;
     }
  }

  Future<MovieModel?> getPopularMovies(int page) async {
    var response = await http.get(Uri.parse("${Utils.popularMoviesUrl}&page=$page"));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      return MovieModel.fromJson(json);
    } else {
      return null;
    }
  }

  Future<MovieGenre?> getMovieGenre() async {
    var response = await http.get(Uri.parse(Utils.genresUrl));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      return MovieGenre.fromJson(json);
    } else {
      return null;
    }
  }

  Future<DetailsModel?> getMovieDetails(int movieId) async {
    var url = "https://api.themoviedb.org/3/movie/$movieId?api_key=bbfda310b517daeeec61e3493ab5efd8&language=en-US";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      return DetailsModel.fromJson(json);
    } else {
      return null;
    }
  }

  Future<CastModel?> getMovieCasting(int movieId) async {
    var url = "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=bbfda310b517daeeec61e3493ab5efd8&language=en-US";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      return CastModel.fromJson(json);
    } else {
      return null;
    }
  }
}