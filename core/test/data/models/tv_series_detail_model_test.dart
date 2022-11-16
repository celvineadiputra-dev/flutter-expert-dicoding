import 'package:core/data/models/genre_model.dart';
import 'package:core/data/models/season_model.dart';
import 'package:core/data/models/tv_series_detail_model.dart';
import 'package:core/domain/entities/tv_series_detail.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/season.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvSeriesDetailModel = TvSeriesDetailModel(
    adult: true,
    backdropPath: "path",
    genres: [GenreModel(id: 1, name: "genre")],
    id: 1,
    languages: ["en"],
    name: "test",
    numberOfEpisodes: 70,
    numberOfSeasons: 8,
    originalLanguage: "en",
    originalName: "test",
    overview: "test",
    popularity: 1.1,
    posterPath: "path",
    seasons: [
      SeasonModel(
          episodeCount: 1,
          id: 1,
          name: "test season",
          overview: "overview",
          posterPath: "path",
          seasonNumber: 1)
    ],
    status: "ended",
    tagline: "ok",
    type: "test",
    voteAverage: 8.4,
    voteCount: 101,
  );

  final tTvSeriesDetail = TvSeriesDetail(
    adult: true,
    backdropPath: "path",
    genres: [Genre(id: 1, name: "genre")],
    id: 1,
    languages: ["en"],
    name: "test",
    numberOfEpisodes: 70,
    numberOfSeasons: 8,
    originalLanguage: "en",
    originalName: "test",
    overview: "test",
    popularity: 1.1,
    posterPath: "path",
    seasons: [
      Season(
          episodeCount: 1,
          id: 1,
          name: "test season",
          overview: "overview",
          posterPath: "path",
          seasonNumber: 1)
    ],
    status: "ended",
    tagline: "ok",
    type: "test",
    voteAverage: 8.4,
    voteCount: 101,
  );

  final String data = '{"adult":true,"backdrop_path":"path","genres":[{"id":1,"name":"genre"}],"id":1,"languages":["en"],"name":"test","number_of_episodes":70,"number_of_seasons":8,"original_language":"en","original_name":"test","overview":"test","popularity":1.1,"poster_path":"path","seasons":[{"episode_count":1,"id":1,"name":"test season","overview":"overview","poster_path":"path","season_number":1}],"status":"ended","tagline":"ok","type":"test","vote_average":8.4,"vote_count":101}';

  final jsonMap = {
    "adult": true,
    "backdrop_path": "path",
    "genres": [{'id': 1, 'name': 'genre'}],
    "id": 1,
    "languages": ["en"],
    "name": "test",
    "number_of_episodes": 70,
    "number_of_seasons": 8,
    "original_language": "en",
    "original_name": "test",
    "overview": "test",
    "popularity": 1.1,
    "poster_path": "path",
    "seasons": [
      {
        'episode_count': 1,
        'id': 1,
        'name': 'test season',
        'overview': 'overview',
        'poster_path': 'path',
        'season_number': 1
      }
    ],
    "status": "ended",
    "tagline": "ok",
    "type": "test",
    "vote_average": 8.4,
    "vote_count": 101,
  };

  group("Tv Series Detail Model Test", () {
    test("subclass", () async {
      final result = tTvSeriesDetailModel.toEntity();
      expect(result, tTvSeriesDetail);
    });

    test("from json", () async {
      final result = TvSeriesDetailModel.fromJson(data);
      expect(result, tTvSeriesDetailModel);
    });

    test("to map", () async {
      final result = tTvSeriesDetailModel.toMap();
      expect(result, jsonMap);
    });
    
    test("to json", () async {
      final result = tTvSeriesDetailModel.toJson();
      expect(result, data);
    });
  });
}
