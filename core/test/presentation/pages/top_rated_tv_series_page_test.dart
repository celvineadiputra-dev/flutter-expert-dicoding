import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/presentation/pages/tv_series_top_rated_page.dart';
import 'package:core/presentation/provider/tv_series_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'top_rated_tv_series_page_test.mocks.dart';

@GenerateMocks([TvSeriesListNotifier])
void main() {
  late MockTvSeriesListNotifier mockTvSeriesListNotifier;

  setUp(() {
    mockTvSeriesListNotifier = MockTvSeriesListNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesListNotifier>.value(
      value: mockTvSeriesListNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("Page should display app bar", (WidgetTester tester) async {
    when(mockTvSeriesListNotifier.topRatedState)
        .thenReturn(RequestState.Loading);

    final appBar = find.byType(AppBar);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesTopRatedPage()));

    expect(appBar, findsOneWidget);
  });

  testWidgets("Page should display progress bar when loading",
      (WidgetTester tester) async {
    when(mockTvSeriesListNotifier.topRatedState)
        .thenReturn(RequestState.Loading);

    final progress = find.byType(CircularProgressIndicator);
    final center = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesTopRatedPage()));

    expect(center, findsOneWidget);
    expect(progress, findsOneWidget);
  });

  testWidgets("Page should display progress bar when loaded",
      (WidgetTester tester) async {
    when(mockTvSeriesListNotifier.topRatedState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesListNotifier.topRatedTvSeries)
        .thenReturn(<TvSeries>[testTvSeries]);

    final listView = find.byType(ListView);
    final card = find.byKey(Key('items_list'));

    await tester.pumpWidget(_makeTestableWidget(TvSeriesTopRatedPage()));

    expect(listView, findsOneWidget);
    expect(card, findsOneWidget);
  });

  testWidgets("Page should display progress bar when error",
      (WidgetTester tester) async {
    when(mockTvSeriesListNotifier.topRatedState).thenReturn(RequestState.Error);
    when(mockTvSeriesListNotifier.message).thenReturn('Error message');

    final text = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TvSeriesTopRatedPage()));

    expect(text, findsOneWidget);
  });
}
