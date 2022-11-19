import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/state_enum.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_event.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetMovieDetail mockGetMovieDetail;
  late MovieDetailBloc movieDetailBloc;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    movieDetailBloc = MovieDetailBloc(mockGetMovieDetail);
  });

  group("Get Movie Detail", () {
    const tId = 1;

    test('InitialState should be Empty', () {
      expect(movieDetailBloc.state,
          const MovieDetailLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetMovieDetail.execute(tId))
          .thenAnswer((_) async => Right(testMovieDetail));

      return movieDetailBloc;
    }, act: (bloc) {
      return bloc.add(const FetchMovieDetail(id: tId));
    }, expect: () {
      return [
        const MovieDetailLoading(state: RequestState.Loading),
        MovieDetailHasData(testMovieDetail)
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetMovieDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return movieDetailBloc;
    }, act: (bloc) {
      return bloc.add(const FetchMovieDetail(id: tId));
    }, expect: () {
      return [
        const MovieDetailLoading(state: RequestState.Loading),
        const MovieDetailError(message: "Server Failure")
      ];
    });
  });
}
