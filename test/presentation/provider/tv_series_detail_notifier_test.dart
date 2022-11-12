import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_series_watch_list_status.dart';
import 'package:ditonton/domain/usecases/remove_tv_series_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_series_watchlist.dart';
import 'package:ditonton/presentation/provider/tv_series_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

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
}
