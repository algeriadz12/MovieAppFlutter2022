
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pop_corn_flix/moor/moor_helper.dart';
part 'movie_state.freezed.dart';


@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    List<MovieData>? movies,
  }) = _MovieState;
}

