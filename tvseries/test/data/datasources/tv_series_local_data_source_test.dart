import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/data/datasources/tv_series_local_data_source.dart';

import '../../dummy_data/dummy_objects.dart';
import 'db/database_helper_test.mocks.dart';

void main() {
  late TvSeriesLocalDataSourceImpl dataSource;
  late MockDatabaseTvSeriesHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseTvSeriesHelper();
    dataSource =
        TvSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      when(mockDatabaseHelper.insertTvSeriesWatchList(testTvSeriesTable))
          .thenAnswer((_) async => 1);

      final result = await dataSource.insertWatchList(testTvSeriesTable);

      expect(result, 'Success added to watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      when(mockDatabaseHelper.insertTvSeriesWatchList(testTvSeriesTable))
          .thenThrow(Exception());

      final call = dataSource.insertWatchList(testTvSeriesTable);

      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      when(mockDatabaseHelper.removeTvSeriesWatchList(testTvSeriesTable))
          .thenAnswer((_) async => 1);

      final result = await dataSource.removeWatchlist(testTvSeriesTable);

      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      when(mockDatabaseHelper.removeTvSeriesWatchList(testTvSeriesTable))
          .thenThrow(Exception());

      final call = dataSource.removeWatchlist(testTvSeriesTable);

      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });
  //
  group('Get Movie Detail By Id', () {
    const tId = 1;

    test('should return Movie Detail Table when data is found', () async {
      when(mockDatabaseHelper.getTvSeriesById(tId))
          .thenAnswer((_) async => testTvSeriesMap);

      final result = await dataSource.getTvSeriesById(tId);

      expect(result, testTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      when(mockDatabaseHelper.getTvSeriesById(tId))
          .thenAnswer((_) async => null);

      final result = await dataSource.getTvSeriesById(tId);

      expect(result, null);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of MovieTable from database', () async {
      when(mockDatabaseHelper.getAllTvSeriesWatchList())
          .thenAnswer((_) async => [testTvSeriesMap]);

      final result = await dataSource.getAllWatchList();

      expect(result, [testTvSeriesTable]);
    });
  });
}
