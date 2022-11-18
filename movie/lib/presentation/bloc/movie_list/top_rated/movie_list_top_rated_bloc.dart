import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';

import 'movie_list_top_rated_event.dart';
import 'movie_list_top_rated_state.dart';


class MovieListTopRatedBloc extends Bloc<MovieListTopRatedEvent, MovieListTopRatedState> {
  final GetTopRatedMovies _topRatedMovie;

  MovieListTopRatedBloc(this._topRatedMovie) : super(const MovieListTopRatedLoading()) {
    on<FetchTopRatedMovies>((event, emit) async {
      emit(const MovieListTopRatedLoading(state: RequestState.Loading));

      final result = await _topRatedMovie.execute();

      result.fold((failure) {
        emit(MovieListTopRatedError(message: failure.message));
      }, (data) {
        if (data.isNotEmpty) {
          emit(MovieListTopRatedHasData(data));
        } else {
          emit(const MovieListTopRatedLoading(state: RequestState.Empty));
        }
      });
    });
  }
}
