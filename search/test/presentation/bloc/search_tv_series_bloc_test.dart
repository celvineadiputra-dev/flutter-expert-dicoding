import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:tvseries/domain/entities/tv_series.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search/presentation/bloc/search_tv_series_bloc.dart';
import 'package:search/presentation/bloc/search_tv_series_event.dart';
import 'package:search/presentation/bloc/search_tv_series_state.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockSearchTvSeries mockSearchTvSeries;
  late SearchTvSeriesBloc searchMovieBloc;

  setUp(() {
    mockSearchTvSeries = MockSearchTvSeries();
    searchMovieBloc = SearchTvSeriesBloc(mockSearchTvSeries);
  });

  final tListTvSeries = <TvSeries>[testTvSeries];
  const tQuery = "test flutter";

  group('search tv series', () {
    blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
        'should change state to loading when usecase is called and gotten data successfully',
        build: () {
          when(mockSearchTvSeries.execute(tQuery))
              .thenAnswer((_) async => Right(tListTvSeries));

          return searchMovieBloc;
        },
        wait: const Duration(seconds: 2),
        act: (bloc) {
          return bloc.add(const QuerySearchTvSeries(tQuery));
        },
        expect: () {
          return [
            const SearchTvSeriesLoading(tvSeriesState: RequestState.Loading),
            SearchTvSeriesHasData(tListTvSeries)
          ];
        });

    blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
        'should return error when data is unsuccessful',
        build: () {
          when(mockSearchTvSeries.execute(tQuery))
              .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
          return searchMovieBloc;
        },
        wait: const Duration(seconds: 2),
        act: (bloc) {
          return bloc.add(const QuerySearchTvSeries(tQuery));
        },
        expect: () {
          return [
            const SearchTvSeriesLoading(tvSeriesState: RequestState.Loading),
            const SearchTvSeriesError('Server Failure')
          ];
        });

    blocTest<SearchTvSeriesBloc, SearchTvSeriesState>(
        'should return error when data is empty',
        build: () {
          when(mockSearchTvSeries.execute(tQuery))
              .thenAnswer((_) async => Right([]));
          return searchMovieBloc;
        },
        wait: const Duration(seconds: 2),
        act: (bloc) {
          return bloc.add(const QuerySearchTvSeries(tQuery));
        },
        expect: () {
          return [
            const SearchTvSeriesLoading(tvSeriesState: RequestState.Loading),
            const SearchTvSeriesLoading(tvSeriesState: RequestState.Empty)
          ];
        });
  });
}
