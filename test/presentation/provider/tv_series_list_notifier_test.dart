import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_now_playing_tv_series.dart';
import 'package:ditonton/domain/usecases/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv_series.dart';
import 'package:ditonton/presentation/provider/tv_series_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_list_notifier_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvSeries, GetPopularTvSeries, GetTopRatedTvSeries])
void main() {
  late TvSeriesListNotifier provider;
  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    provider = TvSeriesListNotifier(
        getNowPlayingTvSeries: mockGetNowPlayingTvSeries,
        getPopularTvSeries: mockGetPopularTvSeries,
        getTopRatedTvSeries: mockGetTopRatedTvSeries)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tListTvSeries = <TvSeries>[testTvSeries];

  group('now playing tv series', () {
    test('initialState should be Empty', () {
      expect(provider.nowPlayingState, equals(RequestState.Empty));
    });

    test('should get data from the usecase', () async {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(tListTvSeries));

      provider.fetchNowPlayingTvSeries();

      verify(mockGetNowPlayingTvSeries.execute());
    });

    test('should change state to Loading when usecase is called', () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(tListTvSeries));

      provider.fetchNowPlayingTvSeries();

      expect(provider.nowPlayingState, RequestState.Loading);
    });

    test('should change movies when data is gotten successfully', () async {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(tListTvSeries));

      await provider.fetchNowPlayingTvSeries();

      expect(provider.nowPlayingState, RequestState.Loaded);
      expect(provider.nowPlayingTvSeries, tListTvSeries);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      await provider.fetchNowPlayingTvSeries();

      expect(provider.nowPlayingState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('popular tv series', () {
    test('should change state to loading when usecase is called', () async {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(tListTvSeries));

      provider.fetchPopularTvSeries();

      expect(provider.popularState, RequestState.Loading);
    });

    test('should change movies data when data is gotten successfully',
        () async {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(tListTvSeries));

      await provider.fetchPopularTvSeries();

      expect(provider.popularState, RequestState.Loaded);
      expect(provider.popularTvSeries, tListTvSeries);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      await provider.fetchPopularTvSeries();

      expect(provider.popularState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('top rated tv series', () {
    test('should change state to loading when usecase is called', () async {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(tListTvSeries));

      provider.fetchTopRatedTvSeries();

      expect(provider.topRatedState, RequestState.Loading);
    });

    test('should change movies data when data is gotten successfully',
        () async {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(tListTvSeries));

      await provider.fetchTopRatedTvSeries();

      expect(provider.topRatedState, RequestState.Loaded);
      expect(provider.topRatedTvSeries, tListTvSeries);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      await provider.fetchTopRatedTvSeries();

      expect(provider.topRatedState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
