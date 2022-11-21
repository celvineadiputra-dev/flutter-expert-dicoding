import 'package:equatable/equatable.dart';

abstract class MovieListPopularEvent extends Equatable {
  const MovieListPopularEvent();

  @override
  List<Object?> get props => [];
}

class FetchPopularMovies extends MovieListPopularEvent {
  @override
  List<Object> get props => [];
}
