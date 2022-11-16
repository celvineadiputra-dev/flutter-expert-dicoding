import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/usecases/get_tv_series_detail.dart';
import 'package:core/domain/usecases/get_tv_series_recommendations.dart';
import 'package:core/domain/usecases/get_tv_series_watch_list_status.dart';
import 'package:core/domain/usecases/remove_tv_series_watchlist.dart';
import 'package:core/domain/usecases/save_tv_series_watchlist.dart';
import 'package:core/presentation/provider/tv_series_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetail,
  GetTvSeriesRecommendation,
  GetTvSeriesWatchListStatus,
  SaveTvSeriesWatchList,
  RemoveTvSeriesWatchList,
])
void main() {
  late TvSeriesDetailNotifier provider;
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late MockGetTvSeriesRecommendation mockGetTvSeriesRecommendation;
  late MockGetTvSeriesWatchListStatus mockGetTvSeriesWatchListStatus;
  late MockSaveTvSeriesWatchList mockSaveTvSeriesWatchList;
  late MockRemoveTvSeriesWatchList mockRemoveTvSeriesWatchList;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    mockGetTvSeriesRecommendation = MockGetTvSeriesRecommendation();
    mockGetTvSeriesWatchListStatus = MockGetTvSeriesWatchListStatus();
    mockSaveTvSeriesWatchList = MockSaveTvSeriesWatchList();
    mockRemoveTvSeriesWatchList = MockRemoveTvSeriesWatchList();
    provider = TvSeriesDetailNotifier(
      getTvSeriesDetail: mockGetTvSeriesDetail,
      getTvSeriesRecommendation: mockGetTvSeriesRecommendation,
      saveTvSeriesWatchList: mockSaveTvSeriesWatchList,
      getTvSeriesWatchListStatus: mockGetTvSeriesWatchListStatus,
      removeTvSeriesWatchList: mockRemoveTvSeriesWatchList,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tId = 1;

  final tListTvSeries = <TvSeries>[testTvSeries];

  void _arrangeUseCase() {
    when(mockGetTvSeriesDetail.execute(tId))
        .thenAnswer((_) async => Right(testTvSeriesDetail));
    when(mockGetTvSeriesRecommendation.execute(tId))
        .thenAnswer((_) async => Right(tListTvSeries));
  }

  group('Get Tv Series Detail', () {
    test('should get data from the usecase', () async {
      _arrangeUseCase();

      await provider.fetchTvSeriesDetail(tId);

      verify(mockGetTvSeriesDetail.execute(tId));
      verify(mockGetTvSeriesRecommendation.execute(tId));
    });

    test('should change state to Loading when usecase is called', () {
      _arrangeUseCase();

      provider.fetchTvSeriesDetail(tId);

      expect(provider.tvSeriesState, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change tv series when data is gotten successfully', () async {
      _arrangeUseCase();

      await provider.fetchTvSeriesDetail(tId);

      expect(provider.tvSeriesState, RequestState.Loaded);
      expect(provider.tvSeriesDetail, testTvSeriesDetail);
      expect(listenerCallCount, 2);
    });

    test('should change recommendation movies when data is gotten successfully',
        () async {
      _arrangeUseCase();

      await provider.fetchTvSeriesDetail(tId);

      expect(provider.tvSeriesState, RequestState.Loaded);
      expect(provider.tvSeriesRecommendation, tListTvSeries);
    });
  });

  group('Get Tv Series Recommendations', () {
    test('should get data from the usecase', () async {
      _arrangeUseCase();

      await provider.fetchTvSeriesDetail(tId);

      verify(mockGetTvSeriesRecommendation.execute(tId));
      expect(provider.tvSeriesRecommendation, tListTvSeries);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      _arrangeUseCase();

      await provider.fetchTvSeriesDetail(tId);

      expect(provider.tvSeriesRecommendationState, RequestState.Loaded);
      expect(provider.tvSeriesRecommendation, tListTvSeries);
    });

    test('should update error message when request in successful', () async {
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => Right(testTvSeriesDetail));
      when(mockGetTvSeriesRecommendation.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));

      await provider.fetchTvSeriesDetail(tId);

      expect(provider.tvSeriesRecommendationState, RequestState.Error);
      expect(provider.message, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      when(mockGetTvSeriesWatchListStatus.execute(1))
          .thenAnswer((_) async => true);

      await provider.loadWatchlistStatus(1);

      expect(provider.isAddtedToWatchList, true);
    });

    test('should execute save watchlist when function called', () async {
      when(mockSaveTvSeriesWatchList.execute(testTvSeriesDetail))
          .thenAnswer((_) async => Right('Success'));
      when(mockGetTvSeriesWatchListStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);

      await provider.addWatchList(testTvSeriesDetail);

      verify(mockSaveTvSeriesWatchList.execute(testTvSeriesDetail));
    });

    test('should execute remove watchlist when function called', () async {
      when(mockRemoveTvSeriesWatchList.execute(testTvSeriesDetail))
          .thenAnswer((_) async => Right('Removed'));
      when(mockGetTvSeriesWatchListStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);

      await provider.removeWatchList(testTvSeriesDetail);

      verify(mockRemoveTvSeriesWatchList.execute(testTvSeriesDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      when(mockSaveTvSeriesWatchList.execute(testTvSeriesDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      when(mockGetTvSeriesWatchListStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);

      await provider.addWatchList(testTvSeriesDetail);

      verify(mockGetTvSeriesWatchListStatus.execute(testMovieDetail.id));
      expect(provider.isAddtedToWatchList, true);
      expect(provider.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      when(mockSaveTvSeriesWatchList.execute(testTvSeriesDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetTvSeriesWatchListStatus.execute(testTvSeriesDetail.id))
          .thenAnswer((_) async => false);

      await provider.addWatchList(testTvSeriesDetail);

      expect(provider.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      when(mockGetTvSeriesDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTvSeriesRecommendation.execute(tId))
          .thenAnswer((_) async => Right(tListTvSeries));

      await provider.fetchTvSeriesDetail(tId);

      expect(provider.tvSeriesState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
