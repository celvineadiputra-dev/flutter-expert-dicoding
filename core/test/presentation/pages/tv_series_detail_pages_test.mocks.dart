// Mocks generated by Mockito 5.3.2 from annotations
// in core/test/presentation/pages/tv_series_detail_pages_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:ui' as _i12;

import 'package:core/core.dart' as _i10;
import 'package:core/domain/entities/tv_series.dart' as _i9;
import 'package:core/domain/entities/tv_series_detail.dart' as _i7;
import 'package:core/domain/usecases/get_tv_series_detail.dart' as _i2;
import 'package:core/domain/usecases/get_tv_series_recommendations.dart' as _i4;
import 'package:core/domain/usecases/get_tv_series_watch_list_status.dart'
    as _i5;
import 'package:core/domain/usecases/remove_tv_series_watchlist.dart' as _i6;
import 'package:core/domain/usecases/save_tv_series_watchlist.dart' as _i3;
import 'package:core/presentation/provider/tv_series_detail_notifier.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeGetTvSeriesDetail_0 extends _i1.SmartFake
    implements _i2.GetTvSeriesDetail {
  _FakeGetTvSeriesDetail_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSaveTvSeriesWatchList_1 extends _i1.SmartFake
    implements _i3.SaveTvSeriesWatchList {
  _FakeSaveTvSeriesWatchList_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTvSeriesRecommendation_2 extends _i1.SmartFake
    implements _i4.GetTvSeriesRecommendation {
  _FakeGetTvSeriesRecommendation_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTvSeriesWatchListStatus_3 extends _i1.SmartFake
    implements _i5.GetTvSeriesWatchListStatus {
  _FakeGetTvSeriesWatchListStatus_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveTvSeriesWatchList_4 extends _i1.SmartFake
    implements _i6.RemoveTvSeriesWatchList {
  _FakeRemoveTvSeriesWatchList_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesDetail_5 extends _i1.SmartFake
    implements _i7.TvSeriesDetail {
  _FakeTvSeriesDetail_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvSeriesDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesDetailNotifier extends _i1.Mock
    implements _i8.TvSeriesDetailNotifier {
  MockTvSeriesDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetTvSeriesDetail get getTvSeriesDetail => (super.noSuchMethod(
        Invocation.getter(#getTvSeriesDetail),
        returnValue: _FakeGetTvSeriesDetail_0(
          this,
          Invocation.getter(#getTvSeriesDetail),
        ),
      ) as _i2.GetTvSeriesDetail);
  @override
  _i3.SaveTvSeriesWatchList get saveTvSeriesWatchList => (super.noSuchMethod(
        Invocation.getter(#saveTvSeriesWatchList),
        returnValue: _FakeSaveTvSeriesWatchList_1(
          this,
          Invocation.getter(#saveTvSeriesWatchList),
        ),
      ) as _i3.SaveTvSeriesWatchList);
  @override
  _i4.GetTvSeriesRecommendation get getTvSeriesRecommendation =>
      (super.noSuchMethod(
        Invocation.getter(#getTvSeriesRecommendation),
        returnValue: _FakeGetTvSeriesRecommendation_2(
          this,
          Invocation.getter(#getTvSeriesRecommendation),
        ),
      ) as _i4.GetTvSeriesRecommendation);
  @override
  _i5.GetTvSeriesWatchListStatus get getTvSeriesWatchListStatus =>
      (super.noSuchMethod(
        Invocation.getter(#getTvSeriesWatchListStatus),
        returnValue: _FakeGetTvSeriesWatchListStatus_3(
          this,
          Invocation.getter(#getTvSeriesWatchListStatus),
        ),
      ) as _i5.GetTvSeriesWatchListStatus);
  @override
  _i6.RemoveTvSeriesWatchList get removeTvSeriesWatchList =>
      (super.noSuchMethod(
        Invocation.getter(#removeTvSeriesWatchList),
        returnValue: _FakeRemoveTvSeriesWatchList_4(
          this,
          Invocation.getter(#removeTvSeriesWatchList),
        ),
      ) as _i6.RemoveTvSeriesWatchList);
  @override
  _i7.TvSeriesDetail get tvSeriesDetail => (super.noSuchMethod(
        Invocation.getter(#tvSeriesDetail),
        returnValue: _FakeTvSeriesDetail_5(
          this,
          Invocation.getter(#tvSeriesDetail),
        ),
      ) as _i7.TvSeriesDetail);
  @override
  List<_i9.TvSeries> get tvSeriesRecommendation => (super.noSuchMethod(
        Invocation.getter(#tvSeriesRecommendation),
        returnValue: <_i9.TvSeries>[],
      ) as List<_i9.TvSeries>);
  @override
  _i10.RequestState get tvSeriesState => (super.noSuchMethod(
        Invocation.getter(#tvSeriesState),
        returnValue: _i10.RequestState.Empty,
      ) as _i10.RequestState);
  @override
  _i10.RequestState get tvSeriesRecommendationState => (super.noSuchMethod(
        Invocation.getter(#tvSeriesRecommendationState),
        returnValue: _i10.RequestState.Empty,
      ) as _i10.RequestState);
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
      ) as String);
  @override
  String get watchlistMessage => (super.noSuchMethod(
        Invocation.getter(#watchlistMessage),
        returnValue: '',
      ) as String);
  @override
  bool get isAddtedToWatchList => (super.noSuchMethod(
        Invocation.getter(#isAddtedToWatchList),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i11.Future<void> fetchTvSeriesDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchTvSeriesDetail,
          [id],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  _i11.Future<void> addWatchList(_i7.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #addWatchList,
          [tvSeriesDetail],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  _i11.Future<void> removeWatchList(_i7.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchList,
          [tvSeriesDetail],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  _i11.Future<void> loadWatchlistStatus(int? id) => (super.noSuchMethod(
        Invocation.method(
          #loadWatchlistStatus,
          [id],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  void addListener(_i12.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i12.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
