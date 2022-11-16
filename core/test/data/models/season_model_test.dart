import 'package:core/data/models/season_model.dart';
import 'package:core/domain/entities/season.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tSeasonModel = SeasonModel(
    episodeCount: 1,
    id: 1,
    name: "season",
    overview: "test coverage",
    posterPath: "url",
    seasonNumber: 1,
  );

  final tSeason = Season(
    episodeCount: 1,
    id: 1,
    name: "season",
    overview: "test coverage",
    posterPath: "url",
    seasonNumber: 1,
  );

  final String data =
      '{"episode_count":1,"id":1,"name":"season","overview":"test coverage","poster_path":"url","season_number":1}';

  final jsonMap = {
    "episode_count": 1,
    "id": 1,
    "name": "season",
    "overview": "test coverage",
    "poster_path": "url",
    "season_number": 1
  };

  group("Season Model Test", () {
    test('should be a subclass of season entity', () async {
      final result = tSeasonModel.toEntity();
      expect(result, tSeason);
    });

    test('from json test season', () async {
      final result = SeasonModel.fromJson(data);
      expect(result, tSeasonModel);
    });

    test('to map test season', () async {
      final result = tSeasonModel.toMap();
      expect(result, jsonMap);
    });

    test('to json test season', () async {
      final result = tSeasonModel.toJson();
      expect(result, data);
    });
  });
}
