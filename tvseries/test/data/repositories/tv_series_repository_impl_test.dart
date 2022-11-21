import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/data/models/genre_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/data/models/season_model.dart';
import 'package:tvseries/data/models/tv_series_detail_model.dart';
import 'package:tvseries/data/models/tv_series_model.dart';
import 'package:tvseries/data/models/tv_series_table.dart';
import 'package:tvseries/data/repositories/tv_series_repository_impl.dart';
import 'package:tvseries/domain/entities/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late TvSeriesRepositoryImpl repository;
  late MockTvSeriesRemoteDataSource mockTvSeriesRemoteDataSource;
  late MockTvSeriesLocalDataSource mockTvSeriesLocalDataSource;

  setUp(() {
    mockTvSeriesRemoteDataSource = MockTvSeriesRemoteDataSource();
    mockTvSeriesLocalDataSource = MockTvSeriesLocalDataSource();

    repository = TvSeriesRepositoryImpl(
        remoteDataSource: mockTvSeriesRemoteDataSource,
        localDataSource: mockTvSeriesLocalDataSource);
  });

  final tTvSeriesModel = TvSeriesModel(
    originCountry: ["en", "id"],
    genreIds: [1, 2, 3],
    firstAirDate: "12 Oktober 2025",
    name: "test flutter",
    originalLanguage: "en",
    originalName: "test coverage",
    overview: "Dicoding test",
    backdropPath: "/url.png",
    posterPath: "/url.png",
    id: 1,
    popularity: 12.9,
    voteAverage: 10.2,
    voteCount: 100,
  );

  final tTvSeriesModelList = <TvSeriesModel>[tTvSeriesModel];
  final tTvSeriesList = <TvSeries>[testTvSeries];

  group('Now Playing Tv Series', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      when(mockTvSeriesRemoteDataSource.getNowPlayingTvSeries())
          .thenAnswer((_) async => tTvSeriesModelList);

      final result = await repository.getNowPlayingTvSeries();

      verify(mockTvSeriesRemoteDataSource.getNowPlayingTvSeries());

      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      when(mockTvSeriesRemoteDataSource.getNowPlayingTvSeries())
          .thenThrow(ServerException());

      final result = await repository.getNowPlayingTvSeries();

      verify(mockTvSeriesRemoteDataSource.getNowPlayingTvSeries());

      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      when(mockTvSeriesRemoteDataSource.getNowPlayingTvSeries())
          .thenThrow(SocketException('Failed to connect to the network'));

      final result = await repository.getNowPlayingTvSeries();

      verify(mockTvSeriesRemoteDataSource.getNowPlayingTvSeries());

      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular Tv Series', () {
    test('should return movie list when call to data source is success',
        () async {
      when(mockTvSeriesRemoteDataSource.getPopularTvSeries())
          .thenAnswer((_) async => tTvSeriesModelList);

      final result = await repository.getPopularTvSeries();

      final resultList = result.getOrElse(() => []);

      expect(resultList, tTvSeriesList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      when(mockTvSeriesRemoteDataSource.getPopularTvSeries())
          .thenThrow(ServerException());

      final result = await repository.getPopularTvSeries();

      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      when(mockTvSeriesRemoteDataSource.getPopularTvSeries())
          .thenThrow(SocketException('Failed to connect to the network'));

      final result = await repository.getPopularTvSeries();

      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Top Rated Tv Series', () {
    test('should return movie list when call to data source is successful',
        () async {
      when(mockTvSeriesRemoteDataSource.getTopRatedTvSeries())
          .thenAnswer((_) async => tTvSeriesModelList);

      final result = await repository.getTopRatedTvSeries();

      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      when(mockTvSeriesRemoteDataSource.getTopRatedTvSeries())
          .thenThrow(ServerException());

      final result = await repository.getTopRatedTvSeries();

      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      when(mockTvSeriesRemoteDataSource.getTopRatedTvSeries())
          .thenThrow(SocketException('Failed to connect to the network'));

      final result = await repository.getTopRatedTvSeries();

      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Movie Detail', () {
    final tId = 1;

    final tvSeriesDetailModel = TvSeriesDetailModel(
      adult: true,
      backdropPath: "path",
      genres: [GenreModel(id: 1, name: "genre")],
      id: 1,
      languages: ["en"],
      name: "test",
      numberOfEpisodes: 70,
      numberOfSeasons: 8,
      originalLanguage: "en",
      originalName: "test",
      overview: "test",
      popularity: 1.1,
      posterPath: "path",
      seasons: [
        SeasonModel(
            episodeCount: 1,
            id: 1,
            name: "test season",
            overview: "overview",
            posterPath: "path",
            seasonNumber: 1)
      ],
      status: "ended",
      tagline: "ok",
      type: "test",
      voteAverage: 8.4,
      voteCount: 101,
    );

    test(
        'should return Movie data when the call to remote data source is successful',
        () async {
      when(mockTvSeriesRemoteDataSource.detailTvSeries(tId))
          .thenAnswer((_) async => tvSeriesDetailModel);

      final result = await repository.getDetailTvSeries(tId);

      verify(mockTvSeriesRemoteDataSource.detailTvSeries(tId));
      expect(result, equals(Right(testTvSeriesDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      when(mockTvSeriesRemoteDataSource.detailTvSeries(tId))
          .thenThrow(ServerException());

      final result = await repository.getDetailTvSeries(tId);

      verify(mockTvSeriesRemoteDataSource.detailTvSeries(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      when(mockTvSeriesRemoteDataSource.detailTvSeries(tId))
          .thenThrow(SocketException('Failed to connect to the network'));

      final result = await repository.getDetailTvSeries(tId);

      verify(mockTvSeriesRemoteDataSource.detailTvSeries(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get Movie Recommendations', () {
    final tTvSeriesList = <TvSeriesModel>[];
    final tId = 1;

    test('should return data (movie list) when the call is successful',
        () async {
      when(mockTvSeriesRemoteDataSource.getRecommendation(tId))
          .thenAnswer((_) async => tTvSeriesList);

      final result = await repository.getRecommendation(tId);

      verify(mockTvSeriesRemoteDataSource.getRecommendation(tId));

      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTvSeriesList));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      when(mockTvSeriesRemoteDataSource.getRecommendation(tId))
          .thenThrow(ServerException());

      final result = await repository.getRecommendation(tId);

      verify(mockTvSeriesRemoteDataSource.getRecommendation(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      when(mockTvSeriesRemoteDataSource.getRecommendation(tId))
          .thenThrow(SocketException('Failed to connect to the network'));

      final result = await repository.getRecommendation(tId);

      verify(mockTvSeriesRemoteDataSource.getRecommendation(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Seach Tv Series', () {
    final tQuery = 'spiderman';

    test('should return movie list when call to data source is successful',
        () async {
      when(mockTvSeriesRemoteDataSource.searchTvSeries(tQuery))
          .thenAnswer((_) async => tTvSeriesModelList);

      final result = await repository.searchTvSeries(tQuery);

      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      when(mockTvSeriesRemoteDataSource.searchTvSeries(tQuery))
          .thenThrow(ServerException());

      final result = await repository.searchTvSeries(tQuery);

      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      when(mockTvSeriesRemoteDataSource.searchTvSeries(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));

      final result = await repository.searchTvSeries(tQuery);

      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      when(mockTvSeriesLocalDataSource
              .insertWatchList(TvSeriesTable.fromEntity(testTvSeriesDetail)))
          .thenAnswer((_) async => 'Success added to watchlist');

      final result = await repository.saveWatchList(testTvSeriesDetail);

      expect(result, Right('Success added to watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      when(mockTvSeriesLocalDataSource
              .insertWatchList(TvSeriesTable.fromEntity(testTvSeriesDetail)))
          .thenThrow(DatabaseException('Failed to add watchlist'));

      final result = await repository.saveWatchList(testTvSeriesDetail);

      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      when(mockTvSeriesLocalDataSource
              .removeWatchlist(TvSeriesTable.fromEntity(testTvSeriesDetail)))
          .thenAnswer((_) async => 'Removed from watchlist');

      final result = await repository.removeWatchList(testTvSeriesDetail);

      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      when(mockTvSeriesLocalDataSource
              .removeWatchlist(TvSeriesTable.fromEntity(testTvSeriesDetail)))
          .thenThrow(DatabaseException('Failed to remove watchlist'));

      final result = await repository.removeWatchList(testTvSeriesDetail);

      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      final tId = 1;
      when(mockTvSeriesLocalDataSource.getTvSeriesById(tId))
          .thenAnswer((_) async => null);

      final result = await repository.isAddedToWatchList(tId);

      expect(result, false);
    });
  });

  group('get watchlist Tv Series', () {
    test('should return list of Tv Series', () async {
      when(mockTvSeriesLocalDataSource.getAllWatchList())
          .thenAnswer((_) async => [testTvSeriesTable]);

      final result = await repository.getAllWatchList();

      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTVSeries]);
    });
  });
}
