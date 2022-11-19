import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_event.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final GetMovieRecommendations _recommendations;

  MovieRecommendationBloc(this._recommendations)
      : super(const MovieRecommendationLoading()) {
    on<FetchRecommendationMovie>((event, emit) async {
      final id = event.id;

      emit(const MovieRecommendationLoading(state: RequestState.Loading));

      final result = await _recommendations.execute(id);

      result.fold(
        (failure) {
          emit(MovieRecommendationError(message: failure.message));
        },
        (data) {
          emit(MovieRecommendationHasData(data));
        },
      );
    });
  }
}
