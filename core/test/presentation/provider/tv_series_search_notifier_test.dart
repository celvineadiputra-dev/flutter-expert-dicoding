import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/usecases/search_tv_series.dart';
import 'package:core/presentation/provider/tv_series_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_search_notifier_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {
  late TvSeriesSearchNotifier provider;
  late MockSearchTvSeries mockSearchTvSeries;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockSearchTvSeries = MockSearchTvSeries();
    provider = TvSeriesSearchNotifier(searchTvSeries: mockSearchTvSeries)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tListTvSeries = <TvSeries>[testTvSeries];
  final tQuery = "test flutter";

  group('search tv series', () {
    test('should change state to loading when usecase is called', () async {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => Right(tListTvSeries));

      provider.fetchTvSeriesSearch(tQuery);

      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => Right(tListTvSeries));

      await provider.fetchTvSeriesSearch(tQuery);

      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, tListTvSeries);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      await provider.fetchTvSeriesSearch(tQuery);

      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
