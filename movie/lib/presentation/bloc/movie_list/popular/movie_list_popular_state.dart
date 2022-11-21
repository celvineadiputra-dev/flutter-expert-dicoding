import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/entities/movie.dart';

abstract class MovieListPopularState extends Equatable {
  const MovieListPopularState();

  @override
  List<Object?> get props => [];
}

class MovieListPopularLoading extends MovieListPopularState {
  final RequestState state;

  const MovieListPopularLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class MovieListPopularError extends MovieListPopularState {
  final String message;

  const MovieListPopularError({required this.message});

  @override
  List<Object?> get props => [message];
}

class MovieListPopularHasData extends MovieListPopularState {
  final List<Movie> result;

  const MovieListPopularHasData(this.result);

  @override
  List<Object?> get props => [result];
}
