import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_series_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_series_remote_data_source.dart';
import 'package:ditonton/data/models/tv_series_table.dart';
import 'package:ditonton/domain/entities/TvSeriesDetail.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class TvSeriesRepositoryImpl implements TvSeriesRepository {
  late TvSeriesLocalDataSource localDataSource;
  late TvSeriesRemoteDataSource remoteDataSource;

  TvSeriesRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTvSeries() async {
    try {
      final result = await remoteDataSource.getNowPlayingTvSeries();

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getPopularTvSeries() async {
    try {
      final result = await remoteDataSource.getPopularTvSeries();

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTopRatedTvSeries() async {
    try {
      final result = await remoteDataSource.getTopRatedTvSeries();

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TvSeriesDetail>> getDetailTvSeries(int id) async {
    try {
      final result = await remoteDataSource.detailTvSeries(id);

      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getRecommendation(int id) async {
    try {
      final result = await remoteDataSource.getRecommendation(id);

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchList(TvSeriesDetail tvSeries) async {
    try {
      final result = await localDataSource
          .insertWatchList(TvSeriesTable.fromEntity(tvSeries));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<bool> isAddedToWatchList(int id) async {
    final result = await localDataSource.getTvSeriesById(id);

    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchList(TvSeriesDetail tvSeriesDetail) async {
    try{
      final result = await localDataSource.removeWatchlist(TvSeriesTable.fromEntity(tvSeriesDetail));

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getAllWatchList() async {
    final result = await localDataSource.getAllWatchList();

    return Right(result.map((e) => e.toEntity()).toList());
  }
}
