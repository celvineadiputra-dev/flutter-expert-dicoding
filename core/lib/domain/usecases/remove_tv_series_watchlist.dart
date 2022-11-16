import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series_detail.dart';
import 'package:core/domain/repositories/tv_series_repository.dart';

class RemoveTvSeriesWatchList {
  final TvSeriesRepository repository;

  RemoveTvSeriesWatchList(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeriesDetail) {
    return repository.removeWatchList(tvSeriesDetail);
  }
}