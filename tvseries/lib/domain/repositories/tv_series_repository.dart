import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../entities/tv_series.dart';
import '../entities/tv_series_detail.dart';

abstract class TvSeriesRepository {
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTvSeries();

  Future<Either<Failure, List<TvSeries>>> getPopularTvSeries();

  Future<Either<Failure, List<TvSeries>>> getTopRatedTvSeries();

  Future<Either<Failure, TvSeriesDetail>> getDetailTvSeries(int id);

  Future<Either<Failure, List<TvSeries>>> getRecommendation(int id);

  Future<Either<Failure, String>> saveWatchList(TvSeriesDetail tvSeriesDetail);

  Future<bool> isAddedToWatchList(int id);

  Future<Either<Failure, String>> removeWatchList(TvSeriesDetail tvSeriesDetail);

  Future<Either<Failure, List<TvSeries>>> getAllWatchList();

  Future<Either<Failure, List<TvSeries>>> searchTvSeries(String query);
}
