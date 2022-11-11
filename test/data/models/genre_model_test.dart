import 'dart:convert';
import 'dart:math';

import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tGenreModel = GenreModel(id: 1, name: "genre");

  final tGenre = Genre(id: 1, name: "genre");

  final String data = '{"id":1,"name":"genre"}';
  group("Genre Model Test", () {
    test('should be a subclass of genre entity', () async {
      final result = tGenreModel.toEntity();
      expect(result, tGenre);
    });

    test("from json", () async {
      final result = GenreModel.fromJson(jsonDecode(data));
      expect(result, tGenreModel);
    });

    test("to json", () async {
      final result = tGenreModel.toJson();
      expect(result, jsonDecode(data));
    });
  });
}
