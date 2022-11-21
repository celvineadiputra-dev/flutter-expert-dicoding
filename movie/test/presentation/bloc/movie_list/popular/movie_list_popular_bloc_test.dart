import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_event.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_state.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_event.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetPopularMovies mockGetPopularMovies;
  late MovieListPopularBloc movieListPopularBloc;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    movieListPopularBloc = MovieListPopularBloc(mockGetPopularMovies);
  });

  group("Popular Movie", () {
    test('InitialState should be Empty', () {
      expect(movieListPopularBloc.state,
          const MovieListPopularLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right([testMovie]));

      return movieListPopularBloc;
    }, act: (bloc) {
      return bloc.add(FetchPopularMovies());
    }, expect: () {
      return [
        const MovieListPopularLoading(state: RequestState.Loading),
        MovieListPopularHasData([testMovie])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return movieListPopularBloc;
    }, act: (bloc) {
      return bloc.add(FetchPopularMovies());
    }, expect: () {
      return [
        const MovieListPopularLoading(state: RequestState.Loading),
        const MovieListPopularError(message: "Server Failure")
      ];
    });

    blocTest("Should state loading and empty state", build: () {
      when(mockGetPopularMovies.execute()).thenAnswer((_) async => Right([]));

      return movieListPopularBloc;
    }, act: (bloc) {
      return bloc.add(FetchPopularMovies());
    }, expect: () {
      return [
        const MovieListPopularLoading(state: RequestState.Loading),
        const MovieListPopularLoading(state: RequestState.Empty)
      ];
    });
  });
}
