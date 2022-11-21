import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/domain/entities/tv_series.dart';
import 'package:tvseries/domain/repositories/tv_series_repository.dart';

class SearchTvSeries {
  final TvSeriesRepository repository;

  SearchTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute(String query) {
    return repository.searchTvSeries(query);
  }
}
