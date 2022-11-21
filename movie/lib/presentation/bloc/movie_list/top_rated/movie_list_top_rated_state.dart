import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

import 'package:movie/domain/entities/movie.dart';

abstract class MovieListTopRatedState extends Equatable {
  const MovieListTopRatedState();

  @override
  List<Object?> get props => [];
}

class MovieListTopRatedLoading extends MovieListTopRatedState {
  final RequestState state;

  const MovieListTopRatedLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class MovieListTopRatedError extends MovieListTopRatedState {
  final String message;

  const MovieListTopRatedError({required this.message});

  @override
  List<Object?> get props => [message];
}

class MovieListTopRatedHasData extends MovieListTopRatedState {
  final List<Movie> result;

  const MovieListTopRatedHasData(this.result);

  @override
  List<Object?> get props => [result];
}
