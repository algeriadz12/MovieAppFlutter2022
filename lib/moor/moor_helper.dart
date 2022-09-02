import 'package:moor_flutter/moor_flutter.dart';
part 'moor_helper.g.dart';


class Movie extends Table {
   IntColumn  get rowID => integer().autoIncrement()();
   TextColumn get title => text()();
   TextColumn get posterUrl => text()();
   TextColumn get rating => text()();
   TextColumn get releaseDate => text()();
   IntColumn  get movieId => integer()();

}

@UseMoor(tables: [Movie])
class AppDatabase extends _$AppDatabase {
   AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(
       path: "db.sqlite", logStatements: true));
   int get schemaVersion => 1;

   Future<List<MovieData>> getMovies() => select(movie).get();
   Stream<List<MovieData>> watchMovies() => select(movie).watch();
   Future<int> insert(MovieData data) => into(movie).insert(data);
   Future deleteMovie(MovieData data) => delete(movie).delete(data);
   Future deleteAllMovies() => delete(movie).go();
}