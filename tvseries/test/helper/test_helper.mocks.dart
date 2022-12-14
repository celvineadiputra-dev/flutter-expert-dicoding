// Mocks generated by Mockito 5.3.2 from annotations
// in tvseries/test/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i23;
import 'dart:typed_data' as _i24;

import 'package:core/core.dart' as _i7;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tvseries/data/datasources/tv_series_local_data_source.dart'
    as _i10;
import 'package:tvseries/data/datasources/tv_series_remote_data_source.dart'
    as _i12;
import 'package:tvseries/data/models/tv_series_detail_model.dart' as _i3;
import 'package:tvseries/data/models/tv_series_model.dart' as _i13;
import 'package:tvseries/data/models/tv_series_table.dart' as _i11;
import 'package:tvseries/domain/entities/tv_series.dart' as _i8;
import 'package:tvseries/domain/entities/tv_series_detail.dart' as _i9;
import 'package:tvseries/domain/repositories/tv_series_repository.dart' as _i4;
import 'package:tvseries/domain/usecases/get_now_playing_tv_series.dart'
    as _i14;
import 'package:tvseries/domain/usecases/get_popular_tv_series.dart' as _i15;
import 'package:tvseries/domain/usecases/get_top_rated_tv_series.dart' as _i16;
import 'package:tvseries/domain/usecases/get_tv_series_detail.dart' as _i17;
import 'package:tvseries/domain/usecases/get_tv_series_recommendations.dart'
    as _i18;
import 'package:tvseries/domain/usecases/get_tv_series_watch_list_status.dart'
    as _i19;
import 'package:tvseries/domain/usecases/get_watchlist_tv_series.dart' as _i20;
import 'package:tvseries/domain/usecases/remove_tv_series_watchlist.dart'
    as _i21;
import 'package:tvseries/domain/usecases/save_tv_series_watchlist.dart' as _i22;

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

class _FakeTvSeriesDetailModel_1 extends _i1.SmartFake
    implements _i3.TvSeriesDetailModel {
  _FakeTvSeriesDetailModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesRepository_2 extends _i1.SmartFake
    implements _i4.TvSeriesRepository {
  _FakeTvSeriesRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i5.StreamedResponse {
  _FakeStreamedResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i4.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getNowPlayingTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingTvSeries,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getNowPlayingTvSeries,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getPopularTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTvSeries,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getPopularTvSeries,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getTopRatedTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTvSeries,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getTopRatedTvSeries,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>> getDetailTvSeries(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailTvSeries,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>>.value(
                _FakeEither_0<_i7.Failure, _i9.TvSeriesDetail>(
          this,
          Invocation.method(
            #getDetailTvSeries,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> getRecommendation(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecommendation,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #getRecommendation,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchList(
          _i9.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchList,
          [tvSeriesDetail],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchList,
            [tvSeriesDetail],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchList(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchList,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchList(
          _i9.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchList,
          [tvSeriesDetail],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchList,
            [tvSeriesDetail],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> getAllWatchList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllWatchList,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #getAllWatchList,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> searchTvSeries(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #searchTvSeries,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
}

/// A class which mocks [TvSeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesLocalDataSource extends _i1.Mock
    implements _i10.TvSeriesLocalDataSource {
  MockTvSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchList(_i11.TvSeriesTable? tvSeriesTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchList,
          [tvSeriesTable],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlist(_i11.TvSeriesTable? tvSeriesTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tvSeriesTable],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i11.TvSeriesTable?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesById,
          [id],
        ),
        returnValue: _i6.Future<_i11.TvSeriesTable?>.value(),
      ) as _i6.Future<_i11.TvSeriesTable?>);
  @override
  _i6.Future<List<_i11.TvSeriesTable>> getAllWatchList() => (super.noSuchMethod(
        Invocation.method(
          #getAllWatchList,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.TvSeriesTable>>.value(<_i11.TvSeriesTable>[]),
      ) as _i6.Future<List<_i11.TvSeriesTable>>);
}

/// A class which mocks [TvSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoteDataSource extends _i1.Mock
    implements _i12.TvSeriesRemoteDataSource {
  MockTvSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i13.TvSeriesModel>> getNowPlayingTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTvSeries,
          [],
        ),
        returnValue:
            _i6.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i6.Future<List<_i13.TvSeriesModel>>);
  @override
  _i6.Future<List<_i13.TvSeriesModel>> getPopularTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvSeries,
          [],
        ),
        returnValue:
            _i6.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i6.Future<List<_i13.TvSeriesModel>>);
  @override
  _i6.Future<List<_i13.TvSeriesModel>> getTopRatedTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvSeries,
          [],
        ),
        returnValue:
            _i6.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i6.Future<List<_i13.TvSeriesModel>>);
  @override
  _i6.Future<_i3.TvSeriesDetailModel> detailTvSeries(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #detailTvSeries,
          [id],
        ),
        returnValue: _i6.Future<_i3.TvSeriesDetailModel>.value(
            _FakeTvSeriesDetailModel_1(
          this,
          Invocation.method(
            #detailTvSeries,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.TvSeriesDetailModel>);
  @override
  _i6.Future<List<_i13.TvSeriesModel>> getRecommendation(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecommendation,
          [id],
        ),
        returnValue:
            _i6.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i6.Future<List<_i13.TvSeriesModel>>);
  @override
  _i6.Future<List<_i13.TvSeriesModel>> searchTvSeries(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i6.Future<List<_i13.TvSeriesModel>>.value(<_i13.TvSeriesModel>[]),
      ) as _i6.Future<List<_i13.TvSeriesModel>>);
}

/// A class which mocks [GetNowPlayingTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetNowPlayingTvSeries extends _i1.Mock
    implements _i14.GetNowPlayingTvSeries {
  MockGetNowPlayingTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
}

/// A class which mocks [GetPopularTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularTvSeries extends _i1.Mock
    implements _i15.GetPopularTvSeries {
  MockGetPopularTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
}

/// A class which mocks [GetTopRatedTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTvSeries extends _i1.Mock
    implements _i16.GetTopRatedTvSeries {
  MockGetTopRatedTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
}

/// A class which mocks [GetTvSeriesDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesDetail extends _i1.Mock implements _i17.GetTvSeriesDetail {
  MockGetTvSeriesDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>>.value(
                _FakeEither_0<_i7.Failure, _i9.TvSeriesDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>>);
}

/// A class which mocks [GetTvSeriesRecommendation].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesRecommendation extends _i1.Mock
    implements _i18.GetTvSeriesRecommendation {
  MockGetTvSeriesRecommendation() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> execute(dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
}

/// A class which mocks [GetTvSeriesWatchListStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvSeriesWatchListStatus extends _i1.Mock
    implements _i19.GetTvSeriesWatchListStatus {
  MockGetTvSeriesWatchListStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i6.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [GetWatchlistTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTvSeries extends _i1.Mock
    implements _i20.GetWatchlistTvSeries {
  MockGetWatchlistTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
}

/// A class which mocks [RemoveTvSeriesWatchList].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveTvSeriesWatchList extends _i1.Mock
    implements _i21.RemoveTvSeriesWatchList {
  MockRemoveTvSeriesWatchList() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> execute(
          _i9.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tvSeriesDetail],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tvSeriesDetail],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
}

/// A class which mocks [SaveTvSeriesWatchList].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveTvSeriesWatchList extends _i1.Mock
    implements _i22.SaveTvSeriesWatchList {
  MockSaveTvSeriesWatchList() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TvSeriesRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvSeriesRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.TvSeriesRepository);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> execute(
          _i9.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tvSeriesDetail],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tvSeriesDetail],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i23.Encoding? encoding,
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
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
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
      ) as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i23.Encoding? encoding,
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
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
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
      ) as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i23.Encoding? encoding,
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
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
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
      ) as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i23.Encoding? encoding,
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
        returnValue: _i6.Future<_i5.Response>.value(_FakeResponse_3(
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
      ) as _i6.Future<_i5.Response>);
  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i24.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i24.Uint8List>.value(_i24.Uint8List(0)),
      ) as _i6.Future<_i24.Uint8List>);
  @override
  _i6.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i5.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
