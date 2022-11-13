import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class SaveTvSeriesWatchList {
  final TvSeriesRepository repository;

  SaveTvSeriesWatchList(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeriesDetail) {
    return repository.saveWatchList(tvSeriesDetail);
  }
}
