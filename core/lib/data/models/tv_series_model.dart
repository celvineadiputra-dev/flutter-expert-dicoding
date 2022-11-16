import 'package:core/domain/entities/tv_series.dart';
import 'package:equatable/equatable.dart';

class TvSeriesModel extends Equatable {
  TvSeriesModel({
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
  final String? name;
  final String? firstAirDate;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final String? backdropPath;
  final String? posterPath;
  final int id;
  final double? popularity;
  final double? voteAverage;
  final int? voteCount;

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) => TvSeriesModel(
      originCountry: List<String>.from(json['origin_country'].map((x) => x)),
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      firstAirDate: json['first_air_date'],
      name: json['name'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      id: json['id'],
      voteAverage: json['vote_average'].toDouble(),
      popularity: json['popularity'].toDouble(),
      voteCount: json['vote_count']);

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "popularity": popularity,
        "id": id,
        "backdrop_path": backdropPath,
        "vote_average": voteAverage,
        "overview": overview,
        "first_air_date": firstAirDate,
        "origin_country": List<dynamic>.from(originCountry.map((e) => e)),
        "genre_ids": List<dynamic>.from(genreIds.map((e) => e)),
        "original_language": originalLanguage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName
      };

  TvSeries toEntity() {
    return TvSeries(
      backdropPath: this.backdropPath,
      firstAirDate: this.firstAirDate,
      genreIds: this.genreIds,
      id: this.id,
      name: this.name,
      originCountry: this.originCountry,
      originalLanguage: this.originalLanguage,
      originalName: this.originalName,
      overview: this.overview,
      popularity: this.popularity,
      posterPath: this.posterPath,
      voteAverage: this.voteAverage,
      voteCount: this.voteCount,
    );
  }

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
