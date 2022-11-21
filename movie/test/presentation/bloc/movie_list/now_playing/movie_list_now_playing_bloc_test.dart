import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_event.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MovieListNowPlayingBloc movieListNowPlayingBloc;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    movieListNowPlayingBloc = MovieListNowPlayingBloc(mockGetNowPlayingMovies);
  });

  group("Now Playing Movie", () {
    test('InitialState should be Empty', () {
      expect(movieListNowPlayingBloc.state,
          const MovieListLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right([testMovie]));

      return movieListNowPlayingBloc;
    }, act: (bloc) {
      return bloc.add(FetchNowPlayingMovies());
    }, expect: () {
      return [
        const MovieListLoading(state: RequestState.Loading),
        MovieListHasData([testMovie])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return movieListNowPlayingBloc;
    }, act: (bloc) {
      return bloc.add(FetchNowPlayingMovies());
    }, expect: () {
      return [
        const MovieListLoading(state: RequestState.Loading),
        const MovieListError(message: "Server Failure")
      ];
    });

    blocTest("Should state loading and empty state", build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => const Right([]));

      return movieListNowPlayingBloc;
    }, act: (bloc) {
      return bloc.add(FetchNowPlayingMovies());
    }, expect: () {
      return [
        const MovieListLoading(state: RequestState.Loading),
        const MovieListLoading(state: RequestState.Empty)
      ];
    });
  });
}
