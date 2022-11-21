import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;
  late TvSeriesTopRatedBloc tvSeriesTopRatedBloc;

  setUp(() {
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    tvSeriesTopRatedBloc = TvSeriesTopRatedBloc(mockGetTopRatedTvSeries);
  });

  group("Top Rated Movie", () {
    test('InitialState should be Empty', () {
      expect(tvSeriesTopRatedBloc.state,
          const TvSeriesTopRatedLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right([testTvSeries]));

      return tvSeriesTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(FetchTopRatedTvSeries());
    }, expect: () {
      return [
        const TvSeriesTopRatedLoading(state: RequestState.Loading),
        TvSeriesTopRatedHasData(result: [testTvSeries])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return tvSeriesTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(FetchTopRatedTvSeries());
    }, expect: () {
      return [
        const TvSeriesTopRatedLoading(state: RequestState.Loading),
        const TvSeriesTopRatedError(message: "Server Failure")
      ];
    });

    blocTest("Should state loading and empty state", build: () {
      when(mockGetTopRatedTvSeries.execute()).thenAnswer((_) async => Right([]));

      return tvSeriesTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(FetchTopRatedTvSeries());
    }, expect: () {
      return [
        const TvSeriesTopRatedLoading(state: RequestState.Loading),
        const TvSeriesTopRatedLoading(state: RequestState.Empty)
      ];
    });
  });
}
