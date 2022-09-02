import 'Genres.dart';

class MovieGenre {
  MovieGenre({
      this.genres,});

  MovieGenre.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
  List<Genres>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final genres = this.genres;
    if (genres != null) {
      map['genres'] = genres.map((v) => v.toJson()).toList();
    }
    return map;
  }

}