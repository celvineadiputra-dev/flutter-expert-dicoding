import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/presentation/pages/tv_series_detail_pages.dart';
import 'package:core/presentation/provider/tv_series_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_pages_test.mocks.dart';

@GenerateMocks([TvSeriesDetailNotifier])
void main() {
  late MockTvSeriesDetailNotifier mockTvSeriesDetailNotifier;

  setUp(() {
    mockTvSeriesDetailNotifier = MockTvSeriesDetailNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesDetailNotifier>.value(
      value: mockTvSeriesDetailNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("Loading", (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loading);

    final loading = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(loading, findsOneWidget);
  });

  testWidgets("Loaded", (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail)
        .thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.isAddtedToWatchList).thenReturn(false);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendationState)
        .thenReturn(RequestState.Empty);

    final safeArea = find.byType(SafeArea);
    final loaded = find.byKey(Key("stack-detail"));

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(safeArea, findsOneWidget);
    expect(loaded, findsOneWidget);
  });

  testWidgets("Empty", (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Empty);
    when(mockTvSeriesDetailNotifier.message)
        .thenReturn("EMPTY");
    when(mockTvSeriesDetailNotifier.isAddtedToWatchList).thenReturn(false);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendationState)
        .thenReturn(RequestState.Empty);

    final loaded = find.text("EMPTY");

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(loaded, findsOneWidget);
  });

  testWidgets("button watch list", (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail)
        .thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.isAddtedToWatchList).thenReturn(false);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendationState)
        .thenReturn(RequestState.Empty);

    final loaded = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(loaded, findsOneWidget);
  });

  testWidgets("button already watch list", (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail)
        .thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.isAddtedToWatchList).thenReturn(true);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendationState)
        .thenReturn(RequestState.Empty);

    final loaded = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(loaded, findsOneWidget);
  });

  testWidgets("Seasons", (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail)
        .thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.isAddtedToWatchList).thenReturn(true);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendationState)
        .thenReturn(RequestState.Empty);

    final loaded = find.byKey(Key("image-season"));
    final text = find.text("70 Episodes");

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(loaded, findsOneWidget);
    expect(text, findsOneWidget);
  });

  testWidgets("Recommendations Loading", (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail)
        .thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.isAddtedToWatchList).thenReturn(true);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendationState)
        .thenReturn(RequestState.Loading);

    final loaded = find.byKey(Key("circular-recommendation"));

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(loaded, findsOneWidget);
  });

  testWidgets("Recommendations Empty", (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail)
        .thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.isAddtedToWatchList).thenReturn(true);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendationState)
        .thenReturn(RequestState.Empty);

    final loaded = find.byKey(Key("empty-recommendation"));

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(loaded, findsOneWidget);
  });

  testWidgets("Recommendations Loaded", (WidgetTester tester) async {
    when(mockTvSeriesDetailNotifier.tvSeriesState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesDetail)
        .thenReturn(testTvSeriesDetail);
    when(mockTvSeriesDetailNotifier.isAddtedToWatchList).thenReturn(true);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendationState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesDetailNotifier.tvSeriesRecommendation)
        .thenReturn(<TvSeries>[testTvSeries]);

    final loaded = find.byKey(Key("image-recommendation"));

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(loaded, findsWidgets);
  });
}
