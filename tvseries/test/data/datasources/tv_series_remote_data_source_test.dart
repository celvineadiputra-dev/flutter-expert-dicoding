// import 'dart:convert';
//
// import 'package:core/core.dart';
// import 'package:core/data/datasources/tv_series_remote_data_source.dart';
// import 'package:core/data/models/tv_series_detail_model.dart';
// import 'package:core/data/models/tv_series_response.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;
//
// import '../../helpers/test_helper.mocks.dart';
// import '../../json_reader.dart';
//
// void main() {
//   late TvSeriesRemoteDataSourceImpl dataSource;
//   late MockHttpClient mockHttpClient;
//
//   setUp(() {
//     mockHttpClient = MockHttpClient();
//     dataSource = TvSeriesRemoteDataSourceImpl(client: mockHttpClient);
//   });
//
//   group('Get Now Playing Tv Series test', () {
//     final tTvSeriesList = TvSeriesResponse.fromJson(
//             jsonDecode(readJson('dummy_data/tv_series_on_air.json')))
//         .tvSeriesList;
//
//     test("Should return http code is 200", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey')))
//           .thenAnswer(
//         (_) async =>
//             http.Response(readJson('dummy_data/tv_series_on_air.json'), 200),
//       );
//
//       final result = await dataSource.getNowPlayingTvSeries();
//
//       expect(result, equals(tTvSeriesList));
//     });
//
//     test("Should return http code is 404 or error code", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey')))
//           .thenAnswer((_) async => http.Response('Not Found', 404));
//
//       final call = dataSource.getNowPlayingTvSeries();
//
//       expect(() => call, throwsA(isA<ServerException>()));
//     });
//   });
//
//   group('Get Popular Tv Series test', () {
//     final tTvSeriesList = TvSeriesResponse.fromJson(
//             jsonDecode(readJson('dummy_data/tv_series_popular.json')))
//         .tvSeriesList;
//
//     test("Should return http code is 200", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
//           .thenAnswer(
//         (_) async =>
//             http.Response(readJson('dummy_data/tv_series_popular.json'), 200),
//       );
//
//       final result = await dataSource.getPopularTvSeries();
//
//       expect(result, equals(tTvSeriesList));
//     });
//
//     test("Should return http code is 404 or error code", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
//           .thenAnswer((_) async => http.Response('Not Found', 404));
//
//       final call = dataSource.getPopularTvSeries();
//
//       expect(() => call, throwsA(isA<ServerException>()));
//     });
//   });
//
//   group('Get Top Rated Tv Series test', () {
//     final tTvSeriesList = TvSeriesResponse.fromJson(
//             jsonDecode(readJson('dummy_data/tv_series_top_rated.json')))
//         .tvSeriesList;
//
//     test("Should return http code is 200", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
//           .thenAnswer(
//         (_) async =>
//             http.Response(readJson('dummy_data/tv_series_top_rated.json'), 200),
//       );
//
//       final result = await dataSource.getTopRatedTvSeries();
//
//       expect(result, equals(tTvSeriesList));
//     });
//
//     test("Should return http code is 404 or error code", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
//           .thenAnswer((_) async => http.Response('Not Found', 404));
//
//       final call = dataSource.getTopRatedTvSeries();
//
//       expect(() => call, throwsA(isA<ServerException>()));
//     });
//   });
//
//   group('Get Detail Tv Series test', () {
//     final tTvSeriesList = TvSeriesDetailModel.fromMap(
//             jsonDecode(readJson('dummy_data/tv_series_detailx.json')));
//
//     test("Should return http code is 200", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/1?$apiKey')))
//           .thenAnswer(
//         (_) async =>
//             http.Response(readJson('dummy_data/tv_series_detailx.json'), 200),
//       );
//
//       final result = await dataSource.detailTvSeries(1);
//
//       expect(result, equals(tTvSeriesList));
//     });
//
//     test("Should return http code is 404 or error code", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/1?$apiKey')))
//           .thenAnswer((_) async => http.Response('Not Found', 404));
//
//       final call = dataSource.detailTvSeries(1);
//
//       expect(() => call, throwsA(isA<ServerException>()));
//     });
//   });
//
//   group('Get Recommendation Tv Series test', () {
//     final tTvSeriesList = TvSeriesResponse.fromJson(
//             jsonDecode(readJson('dummy_data/tv_series_recommendation.json'))).tvSeriesList;
//
//     test("Should return http code is 200", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/1/recommendations?$apiKey')))
//           .thenAnswer(
//         (_) async =>
//             http.Response(readJson('dummy_data/tv_series_recommendation.json'), 200),
//       );
//
//       final result = await dataSource.getRecommendation(1);
//
//       expect(result, equals(tTvSeriesList));
//     });
//
//     test("Should return http code is 404 or error code", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/tv/1/recommendations?$apiKey')))
//           .thenAnswer((_) async => http.Response('Not Found', 404));
//
//       final call = dataSource.getRecommendation(1);
//
//       expect(() => call, throwsA(isA<ServerException>()));
//     });
//   });
//
//   group('Search Tv Series test', () {
//     final tTvSeriesList = TvSeriesResponse.fromJson(
//             jsonDecode(readJson('dummy_data/tv_series_search.json'))).tvSeriesList;
//
//     final tQuery = "Game of Thrones";
//
//     test("Should return http code is 200", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery')))
//           .thenAnswer(
//         (_) async =>
//             http.Response(readJson('dummy_data/tv_series_search.json'), 200),
//       );
//
//       final result = await dataSource.searchTvSeries(tQuery);
//
//       expect(result, tTvSeriesList);
//     });
//
//     test("Should return http code is 404 or error code", () async {
//       when(mockHttpClient.get(Uri.parse('$baseUrl/search/tv?$apiKey&query=Game of Thrones')))
//           .thenAnswer((_) async => http.Response('Not Found', 404));
//
//       final call = dataSource.searchTvSeries(tQuery);
//
//       expect(() => call, throwsA(isA<ServerException>()));
//     });
//   });
// }
