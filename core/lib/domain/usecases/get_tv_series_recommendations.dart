import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/repositories/tv_series_repository.dart';

class GetTvSeriesRecommendation {
  final TvSeriesRepository repository;

  GetTvSeriesRecommendation(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute(id) {
    return repository.getRecommendation(id);
  }
}