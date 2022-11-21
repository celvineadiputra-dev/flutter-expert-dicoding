import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_event.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeries;
  late WatchListTvSeriesBloc watchListTvSeriesBloc;

  setUp(() {
    mockGetWatchlistTvSeries = MockGetWatchlistTvSeries();
    watchListTvSeriesBloc = WatchListTvSeriesBloc(mockGetWatchlistTvSeries);
  });

  group("Get Watch List", () {
    test('InitialState should be Empty', () {
      expect(watchListTvSeriesBloc.state,
          const WatchListLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => Right([testTvSeries]));

      return watchListTvSeriesBloc;
    }, act: (bloc) {
      return bloc.add(const FetchAllWatchList());
    }, expect: () {
      return [
        const WatchListLoading(state: RequestState.Loading),
        WatchListHasData([testTvSeries])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetWatchlistTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return watchListTvSeriesBloc;
    }, act: (bloc) {
      return bloc.add(const FetchAllWatchList());
    }, expect: () {
      return [
        const WatchListLoading(state: RequestState.Loading),
        const WatchListError(message: "Server Failure")
      ];
    });
  });
}
