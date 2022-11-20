// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// import '../../../dummy_data/dummy_objects.dart';
// import '../../../helpers/test_helper.mocks.dart';
//
// void main() {
//   late MockDatabaseHelper mockDatabaseHelper;
//
//   setUp(() {
//     mockDatabaseHelper = MockDatabaseHelper();
//   });
//
//   group("Movie", () {
//     test("Insert Watchlist", () async {
//       when(mockDatabaseHelper.insertWatchlist(testMovieTable))
//           .thenAnswer((_) async => testMovieTable.id);
//
//       final result = await mockDatabaseHelper.insertWatchlist(testMovieTable);
//
//       expect(result, testMovieTable.id);
//     });
//     test("Remove Watchlist", () async {
//       when(mockDatabaseHelper.removeWatchlist(testMovieTable))
//           .thenAnswer((_) async => 1);
//
//       final result = await mockDatabaseHelper.removeWatchlist(testMovieTable);
//
//       expect(result, 1);
//     });
//     test("get Watchlist by id", () async {
//       when(mockDatabaseHelper.getMovieById(1))
//           .thenAnswer((_) async => testMovieTable.toJson());
//
//       final result = await mockDatabaseHelper.getMovieById(1);
//
//       expect(result, testMovieTable.toJson());
//     });
//     test("get Watchlist", () async {
//       when(mockDatabaseHelper.getWatchlistMovies())
//           .thenAnswer((_) async => [testMovieMap]);
//
//       final result = await mockDatabaseHelper.getWatchlistMovies();
//
//       expect(result, [testMovieMap]);
//     });
//   });
//
//   group("TV Series", () {
//     test("Insert Watchlist", () async {
//       when(mockDatabaseHelper.insertTvSeriesWatchList(testTvSeriesTable))
//           .thenAnswer((_) async => testTvSeriesTable.id);
//
//       final result = await mockDatabaseHelper.insertTvSeriesWatchList(testTvSeriesTable);
//
//       expect(result, testTvSeriesTable.id);
//     });
//     test("Remove Watchlist", () async {
//       when(mockDatabaseHelper.removeTvSeriesWatchList(testTvSeriesTable))
//           .thenAnswer((_) async => 1);
//
//       final result = await mockDatabaseHelper.removeTvSeriesWatchList(testTvSeriesTable);
//
//       expect(result, 1);
//     });
//     test("get Watchlist by id", () async {
//       when(mockDatabaseHelper.getTvSeriesById(1))
//           .thenAnswer((_) async => testTvSeriesTable.toJson());
//
//       final result = await mockDatabaseHelper.getTvSeriesById(1);
//
//       expect(result, testTvSeriesTable.toJson());
//     });
//     test("get Watchlist", () async {
//       when(mockDatabaseHelper.getAllTvSeriesWatchList())
//           .thenAnswer((_) async => [testTvSeriesMap]);
//
//       final result = await mockDatabaseHelper.getAllTvSeriesWatchList();
//
//       expect(result, [testTvSeriesMap]);
//     });
//   });
// }
