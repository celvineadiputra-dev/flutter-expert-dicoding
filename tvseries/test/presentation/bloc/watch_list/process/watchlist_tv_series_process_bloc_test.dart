import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_event.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockSaveTvSeriesWatchList mockSaveTvSeriesWatchList;
  late MockRemoveTvSeriesWatchList mockRemoveTvSeriesWatchList;
  late MockGetTvSeriesWatchListStatus mockGetTvSeriesWatchListStatus;

  late WatchlistTvSeriesProcessBloc watchlistTvSeriesProcessBloc;

  setUp(() {
    mockGetTvSeriesWatchListStatus = MockGetTvSeriesWatchListStatus();
    mockRemoveTvSeriesWatchList = MockRemoveTvSeriesWatchList();
    mockSaveTvSeriesWatchList = MockSaveTvSeriesWatchList();

    watchlistTvSeriesProcessBloc = WatchlistTvSeriesProcessBloc(
        mockSaveTvSeriesWatchList, mockRemoveTvSeriesWatchList, mockGetTvSeriesWatchListStatus);
  });
  const tId = 1;
  group("Get Status Watchlist", () {
    blocTest("Return true", build: () {
      when(mockGetTvSeriesWatchListStatus.execute(tId)).thenAnswer((_) async => true);

      return watchlistTvSeriesProcessBloc;
    }, act: (bloc) {
      return bloc.add(const FetchStatusWatchList(tId));
    }, expect: () {
      return [
        const WatchlistProcessLoading(state: RequestState.Loading),
        const WatchlistProcessIsAdded(true)
      ];
    });
  });

  group("Remove Watchlist", () {
    blocTest("Return Success", build: () {
      when(mockRemoveTvSeriesWatchList.execute(testTvSeriesDetail)).thenAnswer((_) async => const Right("Success"));

      return watchlistTvSeriesProcessBloc;
    }, act: (bloc) {
      return bloc.add(RemoveFromWatchList(testTvSeriesDetail));
    }, expect: () {
      return [
        const WatchlistProcessLoading(state: RequestState.Loading),
        const WatchlistProcessMessage("Success")
      ];
    });

    blocTest("Return Error", build: () {
      when(mockRemoveTvSeriesWatchList.execute(testTvSeriesDetail)).thenAnswer((_) async => Left(ServerFailure("ERROR")));

      return watchlistTvSeriesProcessBloc;
    }, act: (bloc) {
      return bloc.add(RemoveFromWatchList(testTvSeriesDetail));
    }, expect: () {
      return [
        const WatchlistProcessLoading(state: RequestState.Loading),
        const WatchlistProcessError(message: 'ERROR')
      ];
    });
  });

  group("Add to Watchlist", () {
    blocTest("Return Success", build: () {
      when(mockSaveTvSeriesWatchList.execute(testTvSeriesDetail)).thenAnswer((_) async => const Right("Success"));

      return watchlistTvSeriesProcessBloc;
    }, act: (bloc) {
      return bloc.add(AddToWatchList(testTvSeriesDetail));
    }, expect: () {
      return [
        const WatchlistProcessLoading(state: RequestState.Loading),
        const WatchlistProcessMessage("Success")
      ];
    });

    blocTest("Return Error", build: () {
      when(mockSaveTvSeriesWatchList.execute(testTvSeriesDetail)).thenAnswer((_) async => Left(ServerFailure("ERROR")));

      return watchlistTvSeriesProcessBloc;
    }, act: (bloc) {
      return bloc.add(AddToWatchList(testTvSeriesDetail));
    }, expect: () {
      return [
        const WatchlistProcessLoading(state: RequestState.Loading),
        const WatchlistProcessError(message: 'ERROR')
      ];
    });
  });
}
