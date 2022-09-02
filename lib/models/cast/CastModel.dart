import 'Cast.dart';
import 'Crew.dart';

class CastModel {
  CastModel({
      this.id, 
      this.cast, 
      this.crew,});

  CastModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(Crew.fromJson(v));
      });
    }
  }
  int? id;
  List<Cast>? cast;
  List<Crew>? crew;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    final cast = this.cast;
    if (cast != null) {
      map['cast'] = cast.map((v) => v.toJson()).toList();
    }
    final crew = this.crew;
    if (crew != null) {
      map['crew'] = crew.map((v) => v.toJson()).toList();
    }
    return map;
  }

}