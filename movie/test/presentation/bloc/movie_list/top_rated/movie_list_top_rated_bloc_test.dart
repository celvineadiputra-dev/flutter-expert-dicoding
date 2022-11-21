import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_event.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MovieListTopRatedBloc movieListTopRatedBloc;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    movieListTopRatedBloc = MovieListTopRatedBloc(mockGetTopRatedMovies);
  });

  group("Top Rated Movie", () {
    test('InitialState should be Empty', () {
      expect(movieListTopRatedBloc.state,
          const MovieListTopRatedLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right([testMovie]));

      return movieListTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(FetchTopRatedMovies());
    }, expect: () {
      return [
        const MovieListTopRatedLoading(state: RequestState.Loading),
        MovieListTopRatedHasData([testMovie])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return movieListTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(FetchTopRatedMovies());
    }, expect: () {
      return [
        const MovieListTopRatedLoading(state: RequestState.Loading),
        const MovieListTopRatedError(message: "Server Failure")
      ];
    });

    blocTest("Should state loading and empty state", build: () {
      when(mockGetTopRatedMovies.execute()).thenAnswer((_) async => const Right([]));

      return movieListTopRatedBloc;
    }, act: (bloc) {
      return bloc.add(FetchTopRatedMovies());
    }, expect: () {
      return [
        const MovieListTopRatedLoading(state: RequestState.Loading),
        const MovieListTopRatedLoading(state: RequestState.Empty)
      ];
    });
  });
}
