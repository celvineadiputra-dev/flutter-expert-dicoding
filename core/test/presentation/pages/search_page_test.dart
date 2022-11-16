import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/presentation/pages/search_page.dart';
import 'package:core/presentation/provider/movie_search_notifier.dart';
import 'package:core/presentation/provider/tv_series_search_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'search_page_test.mocks.dart';

@GenerateMocks([TvSeriesSearchNotifier, MovieSearchNotifier])
void main() {
  late MockTvSeriesSearchNotifier mockTvSeriesSearchNotifier;
  late MockMovieSearchNotifier mockMovieSearchNotifier;

  setUp(() {
    mockTvSeriesSearchNotifier = MockTvSeriesSearchNotifier();
    mockMovieSearchNotifier = MockMovieSearchNotifier();
  });

  Widget _makeTestableWidgetTvSeries(Widget body) {
    return ChangeNotifierProvider<TvSeriesSearchNotifier>.value(
      value: mockTvSeriesSearchNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  Widget _makeTestableWidgetMovie(Widget body) {
    return ChangeNotifierProvider<MovieSearchNotifier>.value(
      value: mockMovieSearchNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("Search Bar", (WidgetTester tester) async {
    final searchBar = find.byType(TextField);

    await tester.pumpWidget(_makeTestableWidgetTvSeries(SearchPage()));

    expect(searchBar, findsOneWidget);
  });

  testWidgets("Radio Button tv series", (WidgetTester tester) async {
    final searchBar = find.byType(ListTile);

    await tester.pumpWidget(_makeTestableWidgetTvSeries(SearchPage()));

    expect(searchBar, findsNWidgets(2));
  });

  testWidgets("Show Progress", (WidgetTester tester) async {
    when(mockTvSeriesSearchNotifier.state).thenReturn(RequestState.Loading);

    final progress = find.byType(CircularProgressIndicator);
    await tester.pumpWidget(_makeTestableWidgetTvSeries(SearchPage(
      isSearch: true,
    )));

    expect(progress, findsOneWidget);
  });

  testWidgets("Show list tv series", (WidgetTester tester) async {
    when(mockTvSeriesSearchNotifier.state).thenReturn(RequestState.Loaded);
    when(mockTvSeriesSearchNotifier.searchResult)
        .thenReturn(<TvSeries>[testTvSeries]);

    final listView = find.byType(ListView);
    final container = find.byKey(Key("container-tv-series"));
    await tester.pumpWidget(_makeTestableWidgetTvSeries(SearchPage(
      isSearch: true,
    )));

    expect(listView, findsOneWidget);
    expect(container, findsOneWidget);
  });

  testWidgets("Show empty tv series", (WidgetTester tester) async {
    when(mockTvSeriesSearchNotifier.state).thenReturn(RequestState.Empty);
    when(mockTvSeriesSearchNotifier.searchResult)
        .thenReturn(<TvSeries>[testTvSeries]);

    final container = find.byKey(Key("container-tv-series-empty"));
    await tester.pumpWidget(_makeTestableWidgetTvSeries(SearchPage(
      isSearch: true,
    )));

    expect(container, findsOneWidget);
  });

  testWidgets("Show Progress movie", (WidgetTester tester) async {
    when(mockMovieSearchNotifier.state).thenReturn(RequestState.Loading);

    final progress = find.byType(CircularProgressIndicator);
    await tester.pumpWidget(_makeTestableWidgetMovie(SearchPage(
      isSearch: true,
      typeSelected: SearchType.MOVIE,
    )));

    expect(progress, findsOneWidget);
  });

  testWidgets("Show list movie", (WidgetTester tester) async {
    when(mockMovieSearchNotifier.state).thenReturn(RequestState.Loaded);
    when(mockMovieSearchNotifier.searchResult).thenReturn(<Movie>[testMovie]);

    final listView = find.byType(ListView);
    final container = find.byKey(Key("container-movie"));
    await tester.pumpWidget(_makeTestableWidgetMovie(SearchPage(
      isSearch: true,
      typeSelected: SearchType.MOVIE,
    )));

    expect(listView, findsOneWidget);
    expect(container, findsOneWidget);
  });

  testWidgets("Show empty movie", (WidgetTester tester) async {
    when(mockMovieSearchNotifier.state).thenReturn(RequestState.Empty);
    when(mockMovieSearchNotifier.searchResult).thenReturn(<Movie>[testMovie]);

    final container = find.byKey(Key("container-movie-empty"));
    await tester.pumpWidget(_makeTestableWidgetMovie(SearchPage(
      isSearch: true,
      typeSelected: SearchType.MOVIE,
    )));

    expect(container, findsOneWidget);
  });

  testWidgets("Show default section", (WidgetTester tester) async {
    final container = find.byKey(Key("container-default"));
    await tester.pumpWidget(_makeTestableWidgetMovie(SearchPage(
      isSearch: false,
    )));

    expect(container, findsOneWidget);
  });
}
