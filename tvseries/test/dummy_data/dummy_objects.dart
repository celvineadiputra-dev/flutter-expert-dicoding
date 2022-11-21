import 'package:core/domain/entities/genre.dart';
import 'package:tvseries/data/models/tv_series_table.dart';
import 'package:tvseries/domain/entities/season.dart';
import 'package:tvseries/domain/entities/tv_series.dart';
import 'package:tvseries/domain/entities/tv_series_detail.dart';

final testTvSeriesMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};

final testTvSeriesTable = TvSeriesTable(
  id: 1,
  name: "name",
  posterPath: "posterPath",
  overview: "overview",
);

final testTvSeries = TvSeries(
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

final testTvSeriesDetail = TvSeriesDetail(
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

final testWatchlistTVSeries = TvSeries.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);