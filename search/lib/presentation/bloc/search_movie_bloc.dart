import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:search/presentation/bloc/search_movie_event.dart';
import 'package:search/presentation/bloc/search_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies _searchMovie;

  SearchMovieBloc(this._searchMovie) : super(const SearchMovieLoading()) {
    on<QuerySearchMovie>((event, emit) async {
      final query = event.query;

      emit(const SearchMovieLoading(movieState: RequestState.Loading));

      final result = await _searchMovie.execute(query);

      result.fold(
        (failure) {
          emit(SearchMovieError(failure.message));
        },
        (data) {
          emit(SearchMovieHasData(data));
        },
      );
    });
  }
}
