import 'package:core/utils/state_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/domain/usecases/get_tv_series_recommendations.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_state.dart';

class TvSeriesRecommendationBloc
    extends Bloc<TvSeriesRecommendationEvent, TvSeriesRecommendationState> {
  final GetTvSeriesRecommendation _tvSeriesRecommendation;

  TvSeriesRecommendationBloc(this._tvSeriesRecommendation)
      : super(const TvSeriesRecommendationLoading()) {
    on<FetchTvSeriesRecommendation>((event, emit) async {
      final id = event.id;

      emit(const TvSeriesRecommendationLoading(state: RequestState.Loading));

      final result = await _tvSeriesRecommendation.execute(id);

      result.fold(
        (failure) {
          emit(TvSeriesRecommendationError(message: failure.message));
        },
        (data) {
          emit(TvSeriesRecommendationHasData(data));
        },
      );
    });
  }
}
