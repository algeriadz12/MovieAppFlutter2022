// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<MovieData>? get movies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieStateCopyWith<MovieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieStateCopyWith<$Res> {
  factory $MovieStateCopyWith(
          MovieState value, $Res Function(MovieState) then) =
      _$MovieStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isReadyData, List<MovieData>? movies});
}

/// @nodoc
class _$MovieStateCopyWithImpl<$Res> implements $MovieStateCopyWith<$Res> {
  _$MovieStateCopyWithImpl(this._value, this._then);

  final MovieState _value;
  // ignore: unused_field
  final $Res Function(MovieState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? movies = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      movies: movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieData>?,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieStateCopyWith<$Res>
    implements $MovieStateCopyWith<$Res> {
  factory _$$_MovieStateCopyWith(
          _$_MovieState value, $Res Function(_$_MovieState) then) =
      __$$_MovieStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isReadyData, List<MovieData>? movies});
}

/// @nodoc
class __$$_MovieStateCopyWithImpl<$Res> extends _$MovieStateCopyWithImpl<$Res>
    implements _$$_MovieStateCopyWith<$Res> {
  __$$_MovieStateCopyWithImpl(
      _$_MovieState _value, $Res Function(_$_MovieState) _then)
      : super(_value, (v) => _then(v as _$_MovieState));

  @override
  _$_MovieState get _value => super._value as _$_MovieState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isReadyData = freezed,
    Object? movies = freezed,
  }) {
    return _then(_$_MovieState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: isReadyData == freezed
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      movies: movies == freezed
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieData>?,
    ));
  }
}

/// @nodoc

class _$_MovieState implements _MovieState {
  const _$_MovieState(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<MovieData>? movies})
      : _movies = movies;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<MovieData>? _movies;
  @override
  List<MovieData>? get movies {
    final value = _movies;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MovieState(isLoading: $isLoading, isReadyData: $isReadyData, movies: $movies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isReadyData, isReadyData) &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isReadyData),
      const DeepCollectionEquality().hash(_movies));

  @JsonKey(ignore: true)
  @override
  _$$_MovieStateCopyWith<_$_MovieState> get copyWith =>
      __$$_MovieStateCopyWithImpl<_$_MovieState>(this, _$identity);
}

abstract class _MovieState implements MovieState {
  const factory _MovieState(
      {final bool isLoading,
      final bool isReadyData,
      final List<MovieData>? movies}) = _$_MovieState;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<MovieData>? get movies;
  @override
  @JsonKey(ignore: true)
  _$$_MovieStateCopyWith<_$_MovieState> get copyWith =>
      throw _privateConstructorUsedError;
}
