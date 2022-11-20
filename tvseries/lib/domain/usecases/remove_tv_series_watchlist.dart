import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../entities/tv_series_detail.dart';
import '../repositories/tv_series_repository.dart';

class RemoveTvSeriesWatchList {
  final TvSeriesRepository repository;

  RemoveTvSeriesWatchList(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeriesDetail) {
    return repository.removeWatchList(tvSeriesDetail);
  }
}
