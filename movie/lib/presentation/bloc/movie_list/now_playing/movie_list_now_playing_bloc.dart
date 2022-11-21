import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_state.dart';

import 'movie_list_now_playing_event.dart';

class MovieListNowPlayingBloc
    extends Bloc<MovieListEvent, MovieListNowPlayingState> {
  final GetNowPlayingMovies _nowPlayingMovies;

  MovieListNowPlayingBloc(this._nowPlayingMovies)
      : super(const MovieListLoading()) {
    on<FetchNowPlayingMovies>((event, emit) async {
      emit(const MovieListLoading(state: RequestState.Loading));

      final result = await _nowPlayingMovies.execute();

      result.fold((failure) {
        emit(MovieListError(message: failure.message));
      }, (data) {
        if (data.isNotEmpty) {
          emit(MovieListHasData(data));
        } else {
          emit(const MovieListLoading(state: RequestState.Empty));
        }
      });
    });
  }
}
