import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/entities/movie.dart';

abstract class MovieListNowPlayingState extends Equatable {
  const MovieListNowPlayingState();

  @override
  List<Object?> get props => [];
}

class MovieListLoading extends MovieListNowPlayingState {
  final RequestState state;

  const MovieListLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class MovieListError extends MovieListNowPlayingState {
  final String message;

  const MovieListError({required this.message});

  @override
  List<Object?> get props => [message];
}

class MovieListHasData extends MovieListNowPlayingState {
  final List<Movie> result;

  const MovieListHasData(this.result);

  @override
  List<Object?> get props => [result];
}
