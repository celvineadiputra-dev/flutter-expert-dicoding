import 'package:equatable/equatable.dart';

abstract class MovieListTopRatedEvent extends Equatable {
  const MovieListTopRatedEvent();

  @override
  List<Object?> get props => [];
}

class FetchTopRatedMovies extends MovieListTopRatedEvent {
  @override
  List<Object> get props => [];
}
