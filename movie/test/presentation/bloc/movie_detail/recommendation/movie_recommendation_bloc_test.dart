import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_event.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MovieRecommendationBloc movieRecommendationBloc;

  setUp(() {
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    movieRecommendationBloc =
        MovieRecommendationBloc(mockGetMovieRecommendations);
  });

  group("Get Recommendation Movie", () {
    const tId = 1;

    test('InitialState should be Empty', () {
      expect(movieRecommendationBloc.state,
          const MovieRecommendationLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => Right([testMovie]));

      return movieRecommendationBloc;
    }, act: (bloc) {
      return bloc.add(const FetchRecommendationMovie(id: tId));
    }, expect: () {
      return [
        const MovieRecommendationLoading(state: RequestState.Loading),
        MovieRecommendationHasData([testMovie])
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return movieRecommendationBloc;
    }, act: (bloc) {
      return bloc.add(const FetchRecommendationMovie(id: tId));
    }, expect: () {
      return [
        const MovieRecommendationLoading(state: RequestState.Loading),
        const MovieRecommendationError(message: "Server Failure")
      ];
    });
  });
}
