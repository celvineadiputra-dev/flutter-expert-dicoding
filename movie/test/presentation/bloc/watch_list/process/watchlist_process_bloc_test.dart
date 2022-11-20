import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_event.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late MockGetWatchListStatus mockGetWatchListStatus;

  late WatchlistProcessBloc watchlistProcessBloc;

  setUp(() {
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockRemoveWatchlist = MockRemoveWatchlist();
    mockSaveWatchlist = MockSaveWatchlist();

    watchlistProcessBloc = WatchlistProcessBloc(
        mockSaveWatchlist, mockRemoveWatchlist, mockGetWatchListStatus);
  });
  const tId = 1;
  group("Get Status Watchlist", () {
    blocTest("Return true", build: () {
      when(mockGetWatchListStatus.execute(tId)).thenAnswer((_) async => true);

      return watchlistProcessBloc;
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
      when(mockRemoveWatchlist.execute(testMovieDetail)).thenAnswer((_) async => const Right("Success"));

      return watchlistProcessBloc;
    }, act: (bloc) {
      return bloc.add(RemoveFromWatchList(testMovieDetail));
    }, expect: () {
      return [
        const WatchlistProcessLoading(state: RequestState.Loading),
        const WatchlistProcessMessage("Success")
      ];
    });

    blocTest("Return Error", build: () {
      when(mockRemoveWatchlist.execute(testMovieDetail)).thenAnswer((_) async => Left(ServerFailure("ERROR")));

      return watchlistProcessBloc;
    }, act: (bloc) {
      return bloc.add(RemoveFromWatchList(testMovieDetail));
    }, expect: () {
      return [
        const WatchlistProcessLoading(state: RequestState.Loading),
        const WatchlistProcessError(message: 'ERROR')
      ];
    });
  });

  group("Add to Watchlist", () {
    blocTest("Return Success", build: () {
      when(mockSaveWatchlist.execute(testMovieDetail)).thenAnswer((_) async => const Right("Success"));

      return watchlistProcessBloc;
    }, act: (bloc) {
      return bloc.add(AddToWatchList(testMovieDetail));
    }, expect: () {
      return [
        const WatchlistProcessLoading(state: RequestState.Loading),
        const WatchlistProcessMessage("Success")
      ];
    });

    blocTest("Return Error", build: () {
      when(mockSaveWatchlist.execute(testMovieDetail)).thenAnswer((_) async => Left(ServerFailure("ERROR")));

      return watchlistProcessBloc;
    }, act: (bloc) {
      return bloc.add(AddToWatchList(testMovieDetail));
    }, expect: () {
      return [
        const WatchlistProcessLoading(state: RequestState.Loading),
        const WatchlistProcessError(message: 'ERROR')
      ];
    });
  });
}
