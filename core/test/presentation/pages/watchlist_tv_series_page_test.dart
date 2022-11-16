import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/presentation/pages/watchlist_tv_series_page.dart';
import 'package:core/presentation/provider/watchlist_tv_series_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_series_page_test.mocks.dart';

@GenerateMocks([WatchlistTvSeriesNotifier])
void main() {
  late MockWatchlistTvSeriesNotifier provider;

  setUp(() {
    provider = MockWatchlistTvSeriesNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<WatchlistTvSeriesNotifier>.value(
      value: provider,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("App Bar", (WidgetTester tester) async {
    when(provider.watchlistState).thenReturn(RequestState.Loading);

    final element = find.byType(AppBar);

    await tester.pumpWidget(_makeTestableWidget(WatchListTvSeries()));

    expect(element, findsOneWidget);
  });

  testWidgets("Loading", (WidgetTester tester) async {
    when(provider.watchlistState).thenReturn(RequestState.Loading);

    final element = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(WatchListTvSeries()));

    expect(element, findsOneWidget);
  });

  testWidgets("empty", (WidgetTester tester) async {
    when(provider.watchlistState).thenReturn(RequestState.Empty);
    when(provider.message).thenReturn("Empty");

    final element = find.byKey(Key("error_message"));

    await tester.pumpWidget(_makeTestableWidget(WatchListTvSeries()));

    expect(element, findsOneWidget);
  });

  testWidgets("loaded", (WidgetTester tester) async {
    when(provider.watchlistState).thenReturn(RequestState.Loaded);
    when(provider.watchlist).thenReturn(<TvSeries>[testTvSeries]);

    final element = find.byType(ListView);
    final key = find.byKey(Key("container-tv-series"));

    await tester.pumpWidget(_makeTestableWidget(WatchListTvSeries()));

    expect(element, findsOneWidget);
    expect(key, findsOneWidget);
  });
}
