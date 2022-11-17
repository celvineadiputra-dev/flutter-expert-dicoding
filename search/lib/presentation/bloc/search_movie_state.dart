import 'package:core/domain/entities/movie.dart';
import 'package:core/utils/state_enum.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';

// part of 'search_movie_bloc.dart';

abstract class SearchMovieState {
  const SearchMovieState();

  List<Object?> get props => [];
}

class SearchMovieLoading extends SearchMovieState {
  final RequestState movieState;

  const SearchMovieLoading({this.movieState = RequestState.Empty});

  @override
  List<Object?> get props => [movieState];
}

class SearchMovieError extends SearchMovieState {
  final String _message;

  const SearchMovieError(this._message);

  List<Object?> get props => [_message];
}

class SearchMovieHasData extends SearchMovieState {
  final List<Movie> searchResult;

  const SearchMovieHasData(this.searchResult);

  @override
  List<Object?> get props => [searchResult];
}
