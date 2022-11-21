import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetTvSeriesRecommendation mockGetTvSeriesRecommendations;
  late TvSeriesRecommendationBloc tvSeriesRecommendationBloc;

  setUp(() {
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendation();
    tvSeriesRecommendationBloc =
        TvSeriesRecommendationBloc(mockGetTvSeriesRecommendations);
  });

  group("Get Recommendation Movie", () {
    const tId = 1;

    test('InitialState should be Empty', () {
      expect(tvSeriesRecommendationBloc.state,
          const TvSeriesRecommendationLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right([testTvSeries]));

      return tvSeriesRecommendationBloc;
    }, act: (bloc) {
      return bloc.add(const FetchTvSeriesRecommendation(id: tId));
    }, expect: () {
      return [
        const TvSeriesRecommendationLoading(state: RequestState.Loading),
        TvSeriesRecommendationHasData([testTvSeries])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetTvSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return tvSeriesRecommendationBloc;
    }, act: (bloc) {
      return bloc.add(const FetchTvSeriesRecommendation(id: tId));
    }, expect: () {
      return [
        const TvSeriesRecommendationLoading(state: RequestState.Loading),
        const TvSeriesRecommendationError(message: "Server Failure")
      ];
    });
  });
}
