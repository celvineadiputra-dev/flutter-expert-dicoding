
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/data/datasources/db/database_tv_series_helper.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'database_helper_test.mocks.dart';

@GenerateMocks([DatabaseTvSeriesHelper])
void main() {
  late MockDatabaseTvSeriesHelper mockDatabaseTvSeriesHelper;

  setUp(() {
    mockDatabaseTvSeriesHelper = MockDatabaseTvSeriesHelper();
  });

  group("TvSeries", () {
    test("Insert Watchlist", () async {
      when(mockDatabaseTvSeriesHelper.insertTvSeriesWatchList(testTvSeriesTable))
          .thenAnswer((_) async => testTvSeriesTable.id);

      final result = await mockDatabaseTvSeriesHelper.insertTvSeriesWatchList(testTvSeriesTable);

      expect(result, testTvSeriesTable.id);
    });

    test("Remove Watchlist", () async {
      when(mockDatabaseTvSeriesHelper.removeTvSeriesWatchList(testTvSeriesTable))
          .thenAnswer((_) async => 1);

      final result = await mockDatabaseTvSeriesHelper.removeTvSeriesWatchList(testTvSeriesTable);

      expect(result, 1);
    });

    test("get Watchlist by id", () async {
      when(mockDatabaseTvSeriesHelper.getTvSeriesById(1))
          .thenAnswer((_) async => testTvSeriesTable.toJson());

      final result = await mockDatabaseTvSeriesHelper.getTvSeriesById(1);

      expect(result, testTvSeriesTable.toJson());
    });

    test("get Watchlist", () async {
      when(mockDatabaseTvSeriesHelper.getAllTvSeriesWatchList())
          .thenAnswer((_) async => [testTvSeriesMap]);

      final result = await mockDatabaseTvSeriesHelper.getAllTvSeriesWatchList();

      expect(result, [testTvSeriesMap]);
    });
  });
}