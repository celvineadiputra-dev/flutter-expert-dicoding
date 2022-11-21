import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/data/models/tv_series_model.dart';
import 'package:tvseries/data/models/tv_series_response.dart';

import '../../json_reader.dart';

void main() {
  final tTvSeriesModel = TvSeriesModel(
    originCountry: ["en", "id"],
    genreIds: [1, 2, 3],
    firstAirDate: "2010-06-09",
    name: "test flutter",
    originalLanguage: "en",
    originalName: "test coverage",
    overview: "Dicoding test",
    backdropPath: "/url.png",
    posterPath: "/url.png",
    id: 1,
    popularity: 12.9,
    voteAverage: 10.2,
    voteCount: 100,
  );

  final tTvSeriesResponseModel =
      TvSeriesResponse(tvSeriesList: <TvSeriesModel>[tTvSeriesModel]);

  group("Tv Series Response Test", () {
    test("from json", () async {
      final Map<String, dynamic> jsonMap =
          jsonDecode(readJson("dummy_data/tv_series_on_air.json"));

      final result = TvSeriesResponse.fromJson(jsonMap);

      expect(result, tTvSeriesResponseModel);
    });

    test("to json", () async {
      final result = tTvSeriesResponseModel.toJson();

      final expectedJsonMap = {
        "results": [
          {
            "poster_path": "/url.png",
            "popularity": 12.9,
            "id": 1,
            "backdrop_path": "/url.png",
            "vote_average": 10.2,
            "overview": "Dicoding test",
            "first_air_date": "2010-06-09",
            "origin_country": ["en", "id"],
            "genre_ids": [1, 2, 3],
            "original_language": "en",
            "vote_count": 100,
            "name": "test flutter",
            "original_name": "test coverage"
          }
        ]
      };

      expect(result, expectedJsonMap);
    });
  });
}
