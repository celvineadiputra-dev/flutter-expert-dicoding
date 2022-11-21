import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late TvSeriesPopularBloc movieListPopularBloc;

  setUp(() {
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    movieListPopularBloc = TvSeriesPopularBloc(mockGetPopularTvSeries);
  });

  group("Popular Movie", () {
    test('InitialState should be Empty', () {
      expect(movieListPopularBloc.state,
          const TvSeriesPopularLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right([testTvSeries]));

      return movieListPopularBloc;
    }, act: (bloc) {
      return bloc.add(FetchPopularTvSeries());
    }, expect: () {
      return [
        const TvSeriesPopularLoading(state: RequestState.Loading),
        TvSeriesPopularHasData(result: [testTvSeries])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return movieListPopularBloc;
    }, act: (bloc) {
      return bloc.add(FetchPopularTvSeries());
    }, expect: () {
      return [
        const TvSeriesPopularLoading(state: RequestState.Loading),
        const TvSeriesPopularError(message: "Server Failure")
      ];
    });

    blocTest("Should state loading and empty state", build: () {
      when(mockGetPopularTvSeries.execute()).thenAnswer((_) async => const Right([]));

      return movieListPopularBloc;
    }, act: (bloc) {
      return bloc.add(FetchPopularTvSeries());
    }, expect: () {
      return [
        const TvSeriesPopularLoading(state: RequestState.Loading),
        const TvSeriesPopularLoading(state: RequestState.Empty)
      ];
    });
  });
}
