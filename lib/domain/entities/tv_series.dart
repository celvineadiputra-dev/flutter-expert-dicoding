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

  TvSeries.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
  });


  List<String>? originCountry;
  List<int>? genreIds;
  String? firstAirDate;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? backdropPath;
  String? posterPath;
  int id;
  double? popularity;
  double? voteAverage;
  int? voteCount;

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
