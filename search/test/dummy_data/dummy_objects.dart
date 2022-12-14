import 'package:core/domain/entities/genre.dart';
import 'package:movie/data/models/movie_table.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/entities/movie_detail.dart';
import 'package:tvseries/data/models/tv_series_table.dart';
import 'package:tvseries/domain/entities/season.dart';
import 'package:tvseries/domain/entities/tv_series.dart';
import 'package:tvseries/domain/entities/tv_series_detail.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testWatchlistTVSeries = TvSeries.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

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
