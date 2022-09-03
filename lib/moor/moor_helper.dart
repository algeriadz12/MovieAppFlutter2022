import 'dart:io';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/ffi.dart';
part 'moor_helper.g.dart';


class Movie extends Table {
   IntColumn  get rowID => integer().autoIncrement()();
   TextColumn get title => text()();
   TextColumn get posterUrl => text()();
   TextColumn get rating => text()();
   TextColumn get releaseDate => text()();
   IntColumn  get movieId => integer()();

}


LazyDatabase _openConnection(){
   return LazyDatabase(() async{
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path,'db.sqlite'));
      return VmDatabase(file);
   });
}

@UseMoor(tables: [Movie])
class MyDatabase extends _$MyDatabase {
   static MyDatabase? _instance;

   static MyDatabase? getInstance(){
       if(_instance == null){
          _instance == MyDatabase();
       }
       return _instance;
   }

   MyDatabase() : super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => throw UnimplementedError();

   Future<List<MovieData>> getMovies() => select(movie).get();
   Stream<List<MovieData>> watchMovies() => select(movie).watch();
   Future<int> insert(MovieData data) => into(movie).insert(data);
   Future deleteMovie(MovieData data) => delete(movie).delete(data);
   Future deleteAllMovies() => delete(movie).go();
}

