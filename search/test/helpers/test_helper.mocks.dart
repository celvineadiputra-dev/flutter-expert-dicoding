// Mocks generated by Mockito 5.3.2 from annotations
// in search/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i20;
import 'dart:typed_data' as _i21;

import 'package:core/core.dart' as _i9;
import 'package:core/data/datasources/tv_series_remote_data_source.dart'
    as _i16;
import 'package:core/data/models/tv_series_detail_model.dart' as _i4;
import 'package:core/data/models/tv_series_model.dart' as _i17;
import 'package:core/domain/entities/tv_series.dart' as _i12;
import 'package:core/domain/entities/tv_series_detail.dart' as _i13;
import 'package:core/domain/repositories/tv_series_repository.dart' as _i6;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie/data/datasources/movie_remote_data_source.dart' as _i14;
import 'package:movie/data/models/movie_detail_model.dart' as _i3;
import 'package:movie/data/models/movie_model.dart' as _i15;
import 'package:movie/domain/entities/movie.dart' as _i10;
import 'package:movie/domain/entities/movie_detail.dart' as _i11;
import 'package:movie/domain/repositories/movie_repository.dart' as _i5;
import 'package:search/domain/usecases/search_movies.dart' as _i18;
import 'package:search/domain/usecases/search_tv_series.dart' as _i19;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetailResponse_1 extends _i1.SmartFake
    implements _i3.MovieDetailResponse {
  _FakeMovieDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesDetailModel_2 extends _i1.SmartFake
    implements _i4.TvSeriesDetailModel {
  _FakeTvSeriesDetailModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieRepository_3 extends _i1.SmartFake
    implements _i5.MovieRepository {
  _FakeMovieRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesRepository_4 extends _i1.SmartFake
    implements _i6.TvSeriesRepository {
  _FakeTvSeriesRepository_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_5 extends _i1.SmartFake implements _i7.Response {
  _FakeResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_6 extends _i1.SmartFake
    implements _i7.StreamedResponse {
  _FakeStreamedResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i5.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i11.MovieDetail>>.value(
                _FakeEither_0<_i9.Failure, _i11.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i11.MovieDetail>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getMovieRecommendations,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> saveWatchlist(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [movie],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> removeWatchlist(
          _i11.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [movie],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #getWatchlistMovies,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i6.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>
      getNowPlayingTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i12.TvSeries>>(
              this,
              Invocation.method(
                #getNowPlayingTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>
      getPopularTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i12.TvSeries>>(
              this,
              Invocation.method(
                #getPopularTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>
      getTopRatedTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>.value(
                    _FakeEither_0<_i9.Failure, List<_i12.TvSeries>>(
              this,
              Invocation.method(
                #getTopRatedTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i13.TvSeriesDetail>> getDetailTvSeries(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailTvSeries,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i13.TvSeriesDetail>>.value(
                _FakeEither_0<_i9.Failure, _i13.TvSeriesDetail>(
          this,
          Invocation.method(
            #getDetailTvSeries,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i13.TvSeriesDetail>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>> getRecommendation(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecommendation,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i12.TvSeries>>(
          this,
          Invocation.method(
            #getRecommendation,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> saveWatchList(
          _i13.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchList,
          [tvSeriesDetail],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #saveWatchList,
            [tvSeriesDetail],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<bool> isAddedToWatchList(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchList,
          [id],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> removeWatchList(
          _i13.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchList,
          [tvSeriesDetail],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, String>>.value(
            _FakeEither_0<_i9.Failure, String>(
          this,
          Invocation.method(
            #removeWatchList,
            [tvSeriesDetail],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>> getAllWatchList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllWatchList,
          [],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i12.TvSeries>>(
          this,
          Invocation.method(
            #getAllWatchList,
            [],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>> searchTvSeries(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i12.TvSeries>>(
          this,
          Invocation.method(
            #searchTvSeries,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i14.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i15.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i8.Future<List<_i15.MovieModel>>);
  @override
  _i8.Future<List<_i15.MovieModel>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i8.Future<List<_i15.MovieModel>>);
  @override
  _i8.Future<List<_i15.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i8.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i8.Future<List<_i15.MovieModel>>);
  @override
  _i8.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i8.Future<_i3.MovieDetailResponse>.value(
            _FakeMovieDetailResponse_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i3.MovieDetailResponse>);
  @override
  _i8.Future<List<_i15.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue:
            _i8.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i8.Future<List<_i15.MovieModel>>);
  @override
  _i8.Future<List<_i15.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i8.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i8.Future<List<_i15.MovieModel>>);
}

/// A class which mocks [TvSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoteDataSource extends _i1.Mock
    implements _i16.TvSeriesRemoteDataSource {
  MockTvSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i17.TvSeriesModel>> getNowPlayingTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);
  @override
  _i8.Future<List<_i17.TvSeriesModel>> getPopularTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);
  @override
  _i8.Future<List<_i17.TvSeriesModel>> getTopRatedTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);
  @override
  _i8.Future<_i4.TvSeriesDetailModel> detailTvSeries(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #detailTvSeries,
          [id],
        ),
        returnValue: _i8.Future<_i4.TvSeriesDetailModel>.value(
            _FakeTvSeriesDetailModel_2(
          this,
          Invocation.method(
            #detailTvSeries,
            [id],
          ),
        )),
      ) as _i8.Future<_i4.TvSeriesDetailModel>);
  @override
  _i8.Future<List<_i17.TvSeriesModel>> getRecommendation(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecommendation,
          [id],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);
  @override
  _i8.Future<List<_i17.TvSeriesModel>> searchTvSeries(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);
}

/// A class which mocks [SearchMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchMovies extends _i1.Mock implements _i18.SearchMovies {
  MockSearchMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.MovieRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>> execute(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>.value(
                _FakeEither_0<_i9.Failure, List<_i10.Movie>>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i10.Movie>>>);
}

/// A class which mocks [SearchTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchTvSeries extends _i1.Mock implements _i19.SearchTvSeries {
  MockSearchTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_4(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i6.TvSeriesRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>> execute(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>.value(
                _FakeEither_0<_i9.Failure, List<_i12.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, List<_i12.TvSeries>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i7.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i7.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i7.Response>.value(_FakeResponse_5(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i7.Response>);
  @override
  _i8.Future<_i7.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i7.Response>.value(_FakeResponse_5(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i7.Response>);
  @override
  _i8.Future<_i7.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i20.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i7.Response>.value(_FakeResponse_5(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i7.Response>);
  @override
  _i8.Future<_i7.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i20.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i7.Response>.value(_FakeResponse_5(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i7.Response>);
  @override
  _i8.Future<_i7.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i20.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i7.Response>.value(_FakeResponse_5(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i7.Response>);
  @override
  _i8.Future<_i7.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i20.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i7.Response>.value(_FakeResponse_5(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i7.Response>);
  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i21.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i21.Uint8List>.value(_i21.Uint8List(0)),
      ) as _i8.Future<_i21.Uint8List>);
  @override
  _i8.Future<_i7.StreamedResponse> send(_i7.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i7.StreamedResponse>.value(_FakeStreamedResponse_6(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i7.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
