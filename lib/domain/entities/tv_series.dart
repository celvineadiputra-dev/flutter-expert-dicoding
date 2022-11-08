import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  TvSeries({
    required this.originCountry,
    required this.genreIds,
    required this.firstAirDate,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.id,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });

  final List<String> originCountry;
  final List<int> genreIds;
  final String firstAirDate;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final int id;
  final int popularity;
  final int voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        genreIds,
        id,
        name,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
