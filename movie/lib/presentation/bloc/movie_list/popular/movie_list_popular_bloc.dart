import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_event.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_state.dart';


class MovieListPopularBloc extends Bloc<MovieListPopularEvent, MovieListPopularState> {
  final GetPopularMovies _popularMovie;

  MovieListPopularBloc(this._popularMovie) : super(const MovieListPopularLoading()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(const MovieListPopularLoading(state: RequestState.Loading));

      final result = await _popularMovie.execute();

      result.fold((failure) {
        emit(MovieListPopularError(message: failure.message));
      }, (data) {
        if (data.isNotEmpty) {
          emit(MovieListPopularHasData(data));
        } else {
          emit(const MovieListPopularLoading(state: RequestState.Empty));
        }
      });
    });
  }
}
