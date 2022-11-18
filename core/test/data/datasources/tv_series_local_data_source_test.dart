// import 'package:core/core.dart';
// import 'package:core/data/datasources/tv_series_local_data_source.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// import '../../dummy_data/dummy_objects.dart';
// import '../../helpers/test_helper.mocks.dart';
//
// void main() {
//   late TvSeriesLocalDataSourceImpl dataSource;
//   late MockDatabaseHelper mockDatabaseHelper;
//
//   setUp(() {
//     mockDatabaseHelper = MockDatabaseHelper();
//     dataSource =
//         TvSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
//   });
//
//   group("Get Tv Series By Id", () {
//     final tId = 1;
//
//     test('Should return tv series detail table when data is found', () async {
//       when(mockDatabaseHelper.getTvSeriesById(tId))
//           .thenAnswer((_) async => testTvSeriesMap);
//
//       final result = await dataSource.getTvSeriesById(tId);
//
//       expect(result, testTvSeriesTable);
//     });
//
//     test('Should return null tv series detail table when data is not found',
//         () async {
//       when(mockDatabaseHelper.getTvSeriesById(tId))
//           .thenAnswer((_) async => null);
//
//       final result = await dataSource.getTvSeriesById(tId);
//
//       expect(result, null);
//     });
//   });
//
//   group("Insert to watchlist", () {
//     test('Should return success message when insert is success', () async {
//       when(mockDatabaseHelper.insertTvSeriesWatchList(testTvSeriesTable))
//           .thenAnswer((_) async => 1);
//
//       final result = await dataSource.insertWatchList(testTvSeriesTable);
//
//       expect(result, "Success added to watchlist");
//     });
//
//     test('Should return success message when insert is failed', () async {
//       when(mockDatabaseHelper.insertTvSeriesWatchList(testTvSeriesTable))
//           .thenThrow(Exception());
//
//       final call = dataSource.insertWatchList(testTvSeriesTable);
//
//       expect(() => call, throwsA(isA<DatabaseException>()));
//     });
//   });
//
//   group("Remove watch list", () {
//     test("Should return success message when remove from database", () async {
//       when(mockDatabaseHelper.removeTvSeriesWatchList(testTvSeriesTable))
//           .thenAnswer((_) async => 1);
//
//       final result = await dataSource.removeWatchlist(testTvSeriesTable);
//
//       expect(result, "Removed from watchlist");
//     });
//
//     test("Should return failed message when remove from database", () async {
//       when(mockDatabaseHelper.removeTvSeriesWatchList(testTvSeriesTable))
//           .thenThrow(Exception());
//
//       final call = dataSource.removeWatchlist(testTvSeriesTable);
//
//       expect(() => call, throwsA(isA<DatabaseException>()));
//     });
//   });
//
//   group("Get All Watch List", () {
//     test("Should return list of watch list tv series", () async {
//       when(mockDatabaseHelper.getAllTvSeriesWatchList())
//           .thenAnswer((_) async => [testTvSeriesMap]);
//
//       final result = await dataSource.getAllWatchList();
//
//       expect(result, [testTvSeriesTable]);
//     });
//   });
// }
