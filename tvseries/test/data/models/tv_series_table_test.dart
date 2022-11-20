// import 'dart:convert';
//
// import 'package:core/data/models/tv_series_table.dart';
// import 'package:core/domain/entities/tv_series_detail.dart';
// import 'package:core/domain/entities/genre.dart';
// import 'package:core/domain/entities/season.dart';
// import 'package:core/domain/entities/tv_series.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   final tTvSeriesTable = TvSeriesTable(
//     id: 1,
//     name: "test",
//     posterPath: "path",
//     overview: "overview",
//   );
//
//   final tTvSeriesDetail = TvSeriesDetail(
//     adult: true,
//     backdropPath: "path",
//     genres: [Genre(id: 1, name: "genre")],
//     id: 1,
//     languages: ["en"],
//     name: "test",
//     numberOfEpisodes: 70,
//     numberOfSeasons: 8,
//     originalLanguage: "en",
//     originalName: "test",
//     overview: "overview",
//     popularity: 1.1,
//     posterPath: "path",
//     seasons: [
//       Season(
//           episodeCount: 1,
//           id: 1,
//           name: "test season",
//           overview: "overview",
//           posterPath: "path",
//           seasonNumber: 1)
//     ],
//     status: "ended",
//     tagline: "ok",
//     type: "test",
//     voteAverage: 8.4,
//     voteCount: 101,
//   );
//
//   final tTvSeriesWatchList = TvSeries.watchlist(
//       id: 1, overview: "overview", posterPath: "path", name: "test");
//
//   final String data =
//       '{"id":1,"name":"test","posterPath":"path","overview":"overview"}';
//
//   final jsonExpected = {
//     'id': 1,
//     'name': 'test',
//     'posterPath': 'path',
//     'overview': 'overview'
//   };
//
//   group("TV Series Table Test", () {
//     test("from entity", () async {
//       final result = TvSeriesTable.fromEntity(tTvSeriesDetail);
//
//       expect(result, tTvSeriesTable);
//     });
//     test("to entity", () async {
//       final result = tTvSeriesTable.toEntity();
//
//       expect(result, tTvSeriesWatchList);
//     });
//     test("from map", () async {
//       final result = TvSeriesTable.fromMap(jsonDecode(data));
//
//       expect(result, tTvSeriesTable);
//     });
//     test("to json", () async {
//       final result = tTvSeriesTable.toJson();
//
//       expect(result, jsonExpected);
//     });
//   });
// }
