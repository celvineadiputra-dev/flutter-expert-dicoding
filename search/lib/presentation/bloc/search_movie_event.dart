import 'package:equatable/equatable.dart';

abstract class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object?> get props => [];
}

class QuerySearchMovie extends SearchMovieEvent {
  final String query;

  const QuerySearchMovie(this.query);

  List<Object?> get props => [query];
}