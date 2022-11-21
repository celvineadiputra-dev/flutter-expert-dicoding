// Mocks generated by Mockito 5.3.2 from annotations
// in tvseries/test/data/datasources/db/database_helper_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i4;
import 'package:tvseries/data/datasources/db/database_tv_series_helper.dart'
    as _i2;
import 'package:tvseries/data/models/tv_series_table.dart' as _i5;

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

/// A class which mocks [DatabaseTvSeriesHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseTvSeriesHelper extends _i1.Mock
    implements _i2.DatabaseTvSeriesHelper {
  MockDatabaseTvSeriesHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i3.Future<_i4.Database?>.value(),
      ) as _i3.Future<_i4.Database?>);
  @override
  _i3.Future<int> insertTvSeriesWatchList(_i5.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertTvSeriesWatchList,
          [tvSeries],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
  @override
  _i3.Future<Map<String, dynamic>?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesById,
          [id],
        ),
        returnValue: _i3.Future<Map<String, dynamic>?>.value(),
      ) as _i3.Future<Map<String, dynamic>?>);
  @override
  _i3.Future<int> removeTvSeriesWatchList(_i5.TvSeriesTable? tvSeriesTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeTvSeriesWatchList,
          [tvSeriesTable],
        ),
        returnValue: _i3.Future<int>.value(0),
      ) as _i3.Future<int>);
  @override
  _i3.Future<List<Map<String, dynamic>>> getAllTvSeriesWatchList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllTvSeriesWatchList,
          [],
        ),
        returnValue: _i3.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i3.Future<List<Map<String, dynamic>>>);
}
