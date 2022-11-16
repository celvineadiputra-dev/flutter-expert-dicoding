import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/usecases/get_watchlist_tv_series.dart';
import 'package:core/presentation/provider/watchlist_tv_series_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_series_notifier_test.mocks.dart';

@GenerateMocks([GetWatchlistTvSeries])
void main() {
  late WatchlistTvSeriesNotifier provider;
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeries;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistTvSeries = MockGetWatchlistTvSeries();
    provider = WatchlistTvSeriesNotifier(
        getWatchlistTvSeries: mockGetWatchlistTvSeries)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  test("Should change data when data is gotten successfully", () async {
    when(mockGetWatchlistTvSeries.execute())
        .thenAnswer((_) async => Right([testWatchlistTVSeries]));

    await provider.fetchWatchlistTvSeries();

    expect(provider.watchlistState, RequestState.Loaded);
    expect(provider.watchlist, [testWatchlistTVSeries]);
    expect(listenerCallCount, 2);
  });

  test("should return error when data is unsuccessful", () async {
    when(mockGetWatchlistTvSeries.execute())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));

    await provider.fetchWatchlistTvSeries();

    expect(provider.watchlistState, RequestState.Error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
