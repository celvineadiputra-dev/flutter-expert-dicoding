import 'package:core/data/models/tv_series_model.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvSeriesModel = TvSeriesModel(
    originCountry: ["en", "id"],
    genreIds: [1, 2, 3],
    firstAirDate: "12 Oktober 2025",
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

  final tTvSeries = TvSeries(
    originCountry: ["en", "id"],
    genreIds: [1, 2, 3],
    firstAirDate: "12 Oktober 2025",
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

  group("Tv Series Model Test", () {
    test('should be a subclass of tvSeries entity', () async {
      final result = tTvSeriesModel.toEntity();
      expect(result, tTvSeries);
    });

    test('from json test', () async {
      final result = TvSeriesModel.fromJson(tTvSeriesModel.toJson());
      expect(result, tTvSeriesModel);
    });
  });
}
