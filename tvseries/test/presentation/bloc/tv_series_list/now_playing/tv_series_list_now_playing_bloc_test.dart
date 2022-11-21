import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;
  late TvSeriesNowPlayingBloc tvSeriesNowPlayingBloc;

  setUp(() {
    mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
    tvSeriesNowPlayingBloc = TvSeriesNowPlayingBloc(mockGetNowPlayingTvSeries);
  });

  group("Now Playing Movie", () {
    test('InitialState should be Empty', () {
      expect(tvSeriesNowPlayingBloc.state,
          const TvSeriesNowPlayingLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right([testTvSeries]));

      return tvSeriesNowPlayingBloc;
    }, act: (bloc) {
      return bloc.add(FetchNowPlayingTvSeries());
    }, expect: () {
      return [
        const TvSeriesNowPlayingLoading(state: RequestState.Loading),
        TvSeriesNowPlayingHasData(result: [testTvSeries])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return tvSeriesNowPlayingBloc;
    }, act: (bloc) {
      return bloc.add(FetchNowPlayingTvSeries());
    }, expect: () {
      return [
        const TvSeriesNowPlayingLoading(state: RequestState.Loading),
        const TvSeriesNowPlayingError(message: "Server Failure")
      ];
    });

    blocTest("Should state loading and empty state", build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right([]));

      return tvSeriesNowPlayingBloc;
    }, act: (bloc) {
      return bloc.add(FetchNowPlayingTvSeries());
    }, expect: () {
      return [
        const TvSeriesNowPlayingLoading(state: RequestState.Loading),
        const TvSeriesNowPlayingLoading(state: RequestState.Empty)
      ];
    });
  });
}
