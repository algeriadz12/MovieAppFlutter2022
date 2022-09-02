// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MovieData extends DataClass implements Insertable<MovieData> {
  final int rowID;
  final String title;
  final String posterUrl;
  final String rating;
  final String releaseDate;
  final int movieId;
  MovieData(
      {required this.rowID,
      required this.title,
      required this.posterUrl,
      required this.rating,
      required this.releaseDate,
      required this.movieId});
  factory MovieData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MovieData(
      rowID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}row_i_d'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      posterUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_url'])!,
      rating: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
      releaseDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date'])!,
      movieId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}movie_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['row_i_d'] = Variable<int>(rowID);
    map['title'] = Variable<String>(title);
    map['poster_url'] = Variable<String>(posterUrl);
    map['rating'] = Variable<String>(rating);
    map['release_date'] = Variable<String>(releaseDate);
    map['movie_id'] = Variable<int>(movieId);
    return map;
  }

  MovieCompanion toCompanion(bool nullToAbsent) {
    return MovieCompanion(
      rowID: Value(rowID),
      title: Value(title),
      posterUrl: Value(posterUrl),
      rating: Value(rating),
      releaseDate: Value(releaseDate),
      movieId: Value(movieId),
    );
  }

  factory MovieData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MovieData(
      rowID: serializer.fromJson<int>(json['rowID']),
      title: serializer.fromJson<String>(json['title']),
      posterUrl: serializer.fromJson<String>(json['posterUrl']),
      rating: serializer.fromJson<String>(json['rating']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      movieId: serializer.fromJson<int>(json['movieId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rowID': serializer.toJson<int>(rowID),
      'title': serializer.toJson<String>(title),
      'posterUrl': serializer.toJson<String>(posterUrl),
      'rating': serializer.toJson<String>(rating),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'movieId': serializer.toJson<int>(movieId),
    };
  }

  MovieData copyWith(
          {int? rowID,
          String? title,
          String? posterUrl,
          String? rating,
          String? releaseDate,
          int? movieId}) =>
      MovieData(
        rowID: rowID ?? this.rowID,
        title: title ?? this.title,
        posterUrl: posterUrl ?? this.posterUrl,
        rating: rating ?? this.rating,
        releaseDate: releaseDate ?? this.releaseDate,
        movieId: movieId ?? this.movieId,
      );
  @override
  String toString() {
    return (StringBuffer('MovieData(')
          ..write('rowID: $rowID, ')
          ..write('title: $title, ')
          ..write('posterUrl: $posterUrl, ')
          ..write('rating: $rating, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('movieId: $movieId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(rowID, title, posterUrl, rating, releaseDate, movieId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieData &&
          other.rowID == this.rowID &&
          other.title == this.title &&
          other.posterUrl == this.posterUrl &&
          other.rating == this.rating &&
          other.releaseDate == this.releaseDate &&
          other.movieId == this.movieId);
}

class MovieCompanion extends UpdateCompanion<MovieData> {
  final Value<int> rowID;
  final Value<String> title;
  final Value<String> posterUrl;
  final Value<String> rating;
  final Value<String> releaseDate;
  final Value<int> movieId;
  const MovieCompanion({
    this.rowID = const Value.absent(),
    this.title = const Value.absent(),
    this.posterUrl = const Value.absent(),
    this.rating = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.movieId = const Value.absent(),
  });
  MovieCompanion.insert({
    this.rowID = const Value.absent(),
    required String title,
    required String posterUrl,
    required String rating,
    required String releaseDate,
    required int movieId,
  })  : title = Value(title),
        posterUrl = Value(posterUrl),
        rating = Value(rating),
        releaseDate = Value(releaseDate),
        movieId = Value(movieId);
  static Insertable<MovieData> custom({
    Expression<int>? rowID,
    Expression<String>? title,
    Expression<String>? posterUrl,
    Expression<String>? rating,
    Expression<String>? releaseDate,
    Expression<int>? movieId,
  }) {
    return RawValuesInsertable({
      if (rowID != null) 'row_i_d': rowID,
      if (title != null) 'title': title,
      if (posterUrl != null) 'poster_url': posterUrl,
      if (rating != null) 'rating': rating,
      if (releaseDate != null) 'release_date': releaseDate,
      if (movieId != null) 'movie_id': movieId,
    });
  }

  MovieCompanion copyWith(
      {Value<int>? rowID,
      Value<String>? title,
      Value<String>? posterUrl,
      Value<String>? rating,
      Value<String>? releaseDate,
      Value<int>? movieId}) {
    return MovieCompanion(
      rowID: rowID ?? this.rowID,
      title: title ?? this.title,
      posterUrl: posterUrl ?? this.posterUrl,
      rating: rating ?? this.rating,
      releaseDate: releaseDate ?? this.releaseDate,
      movieId: movieId ?? this.movieId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rowID.present) {
      map['row_i_d'] = Variable<int>(rowID.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (posterUrl.present) {
      map['poster_url'] = Variable<String>(posterUrl.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(rating.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieCompanion(')
          ..write('rowID: $rowID, ')
          ..write('title: $title, ')
          ..write('posterUrl: $posterUrl, ')
          ..write('rating: $rating, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('movieId: $movieId')
          ..write(')'))
        .toString();
  }
}

class $MovieTable extends Movie with TableInfo<$MovieTable, MovieData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _rowIDMeta = const VerificationMeta('rowID');
  @override
  late final GeneratedColumn<int?> rowID = GeneratedColumn<int?>(
      'row_i_d', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _posterUrlMeta = const VerificationMeta('posterUrl');
  @override
  late final GeneratedColumn<String?> posterUrl = GeneratedColumn<String?>(
      'poster_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<String?> rating = GeneratedColumn<String?>(
      'rating', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String?> releaseDate = GeneratedColumn<String?>(
      'release_date', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _movieIdMeta = const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int?> movieId = GeneratedColumn<int?>(
      'movie_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [rowID, title, posterUrl, rating, releaseDate, movieId];
  @override
  String get aliasedName => _alias ?? 'movie';
  @override
  String get actualTableName => 'movie';
  @override
  VerificationContext validateIntegrity(Insertable<MovieData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('row_i_d')) {
      context.handle(_rowIDMeta,
          rowID.isAcceptableOrUnknown(data['row_i_d']!, _rowIDMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_url')) {
      context.handle(_posterUrlMeta,
          posterUrl.isAcceptableOrUnknown(data['poster_url']!, _posterUrlMeta));
    } else if (isInserting) {
      context.missing(_posterUrlMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rowID};
  @override
  MovieData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MovieData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MovieTable createAlias(String alias) {
    return $MovieTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MovieTable movie = $MovieTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movie];
}
