import 'package:equatable/equatable.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object?> get props => [];
}

class FetchNowPlayingMovies extends MovieListEvent {
  @override
  List<Object> get props => [];
}