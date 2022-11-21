import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_state.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late TvSeriesDetailBloc tvSeriesDetailBloc;

  setUp(() {
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    tvSeriesDetailBloc = TvSeriesDetailBloc(mockGetTvSeriesDetail);
  });

  group("Get Tv Series Detail", () {
    const tId = 1;

    test('InitialState should be Empty', () {
      expect(tvSeriesDetailBloc.state,
          const TvSeriesDetailLoading(state: RequestState.Empty));
    });

    blocTest("Should state loading and has data state", build: () {
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesDetail));

      return tvSeriesDetailBloc;
    }, act: (bloc) {
      return bloc.add(const FetchTvSeriesDetail(id: tId));
    }, expect: () {
      return [
        const TvSeriesDetailLoading(state: RequestState.Loading),
        TvSeriesDetailHasData(testTvSeriesDetail)
      ];
    });

    blocTest("Should state loading and error state", build: () {
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      return tvSeriesDetailBloc;
    }, act: (bloc) {
      return bloc.add(const FetchTvSeriesDetail(id: tId));
    }, expect: () {
      return [
        const TvSeriesDetailLoading(state: RequestState.Loading),
        const TvSeriesDetailError(message: "Server Failure")
      ];
    });
  });
}
