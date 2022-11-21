import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_event.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late WatchListBloc watchListBloc;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    watchListBloc = WatchListBloc(mockGetWatchlistMovies);
  });

  group("Get Watch List", () {
    test('InitialState should be Empty', () {
      expect(watchListBloc.state,
          const WatchListLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right([testMovie]));

      return watchListBloc;
    }, act: (bloc) {
      return bloc.add(const FetchAllWatchList());
    }, expect: () {
      return [
        const WatchListLoading(state: RequestState.Loading),
        WatchListHasData([testMovie])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return watchListBloc;
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
