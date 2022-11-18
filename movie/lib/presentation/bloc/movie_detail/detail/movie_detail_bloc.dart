import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_event.dart';

import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail _movieDetail;

  MovieDetailBloc(this._movieDetail) : super(const MovieDetailLoading()) {
    on<FetchMovieDetail>((event, emit) async {
      final id = event.id;

      emit(const MovieDetailLoading(state: RequestState.Loading));

      final result = await _movieDetail.execute(id);

      result.fold(
        (failure) {
          emit(MovieDetailError(message: failure.message));
        },
        (data) {
          emit(MovieDetailHasData(data));
        },
      );
    });
  }
}
