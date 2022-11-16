// Mocks generated by Mockito 5.3.2 from annotations
// in core/test/presentation/pages/top_rated_tv_series_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i9;

import 'package:core/core.dart' as _i7;
import 'package:core/domain/entities/tv_series.dart' as _i6;
import 'package:core/domain/usecases/get_now_playing_tv_series.dart' as _i2;
import 'package:core/domain/usecases/get_popular_tv_series.dart' as _i3;
import 'package:core/domain/usecases/get_top_rated_tv_series.dart' as _i4;
import 'package:core/presentation/provider/tv_series_list_notifier.dart' as _i5;
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

class _FakeGetNowPlayingTvSeries_0 extends _i1.SmartFake
    implements _i2.GetNowPlayingTvSeries {
  _FakeGetNowPlayingTvSeries_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetPopularTvSeries_1 extends _i1.SmartFake
    implements _i3.GetPopularTvSeries {
  _FakeGetPopularTvSeries_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTopRatedTvSeries_2 extends _i1.SmartFake
    implements _i4.GetTopRatedTvSeries {
  _FakeGetTopRatedTvSeries_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvSeriesListNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesListNotifier extends _i1.Mock
    implements _i5.TvSeriesListNotifier {
  MockTvSeriesListNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetNowPlayingTvSeries get getNowPlayingTvSeries => (super.noSuchMethod(
        Invocation.getter(#getNowPlayingTvSeries),
        returnValue: _FakeGetNowPlayingTvSeries_0(
          this,
          Invocation.getter(#getNowPlayingTvSeries),
        ),
      ) as _i2.GetNowPlayingTvSeries);
  @override
  _i3.GetPopularTvSeries get getPopularTvSeries => (super.noSuchMethod(
        Invocation.getter(#getPopularTvSeries),
        returnValue: _FakeGetPopularTvSeries_1(
          this,
          Invocation.getter(#getPopularTvSeries),
        ),
      ) as _i3.GetPopularTvSeries);
  @override
  _i4.GetTopRatedTvSeries get getTopRatedTvSeries => (super.noSuchMethod(
        Invocation.getter(#getTopRatedTvSeries),
        returnValue: _FakeGetTopRatedTvSeries_2(
          this,
          Invocation.getter(#getTopRatedTvSeries),
        ),
      ) as _i4.GetTopRatedTvSeries);
  @override
  List<_i6.TvSeries> get nowPlayingTvSeries => (super.noSuchMethod(
        Invocation.getter(#nowPlayingTvSeries),
        returnValue: <_i6.TvSeries>[],
      ) as List<_i6.TvSeries>);
  @override
  List<_i6.TvSeries> get popularTvSeries => (super.noSuchMethod(
        Invocation.getter(#popularTvSeries),
        returnValue: <_i6.TvSeries>[],
      ) as List<_i6.TvSeries>);
  @override
  List<_i6.TvSeries> get topRatedTvSeries => (super.noSuchMethod(
        Invocation.getter(#topRatedTvSeries),
        returnValue: <_i6.TvSeries>[],
      ) as List<_i6.TvSeries>);
  @override
  _i7.RequestState get nowPlayingState => (super.noSuchMethod(
        Invocation.getter(#nowPlayingState),
        returnValue: _i7.RequestState.Empty,
      ) as _i7.RequestState);
  @override
  _i7.RequestState get popularState => (super.noSuchMethod(
        Invocation.getter(#popularState),
        returnValue: _i7.RequestState.Empty,
      ) as _i7.RequestState);
  @override
  _i7.RequestState get topRatedState => (super.noSuchMethod(
        Invocation.getter(#topRatedState),
        returnValue: _i7.RequestState.Empty,
      ) as _i7.RequestState);
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
      ) as String);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i8.Future<void> fetchNowPlayingTvSeries() => (super.noSuchMethod(
        Invocation.method(
          #fetchNowPlayingTvSeries,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> fetchPopularTvSeries() => (super.noSuchMethod(
        Invocation.method(
          #fetchPopularTvSeries,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> fetchTopRatedTvSeries() => (super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedTvSeries,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  void addListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
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
