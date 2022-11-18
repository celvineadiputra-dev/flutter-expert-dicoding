import 'package:core/core.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/search_movie_bloc.dart';
import 'package:search/presentation/bloc/search_movie_state.dart';
import 'package:search/presentation/bloc/search_tv_series_bloc.dart';
import 'package:search/presentation/bloc/search_tv_series_state.dart';
import 'package:search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/mock_search_movie.dart';
import '../../helpers/mock_search_tv_series.dart';

void main() {
  late MockSearchTvSeriesBloc mockSearchTvSeriesBloc;
  late MockSearchMovieBloc mockSearchMovieBloc;

  setUpAll(() {
    registerFallbackValue(MockSearchTvSeriesEvent());
    registerFallbackValue(MockSearchMovieState());
    mockSearchTvSeriesBloc = MockSearchTvSeriesBloc();

    registerFallbackValue(MockSearchMovieEvent());
    registerFallbackValue(MockSearchMovieState());
    mockSearchMovieBloc = MockSearchMovieBloc();
  });

  tearDown(() {
    mockSearchMovieBloc.close();
    mockSearchTvSeriesBloc.close();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SearchTvSeriesBloc>(
            create: (_) => mockSearchTvSeriesBloc,
          ),
          BlocProvider<SearchMovieBloc>(
            create: (_) => mockSearchMovieBloc,
          )
        ],
        child: Builder(
          builder: (_) => MaterialApp(
            home: body,
          ),
        ));
  }

  testWidgets("Search Bar", (WidgetTester tester) async {
    final searchBar = find.byType(TextField);

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    expect(searchBar, findsOneWidget);
  });

  testWidgets("Radio Button tv series", (WidgetTester tester) async {
    final searchBar = find.byType(ListTile);

    await tester.pumpWidget(_makeTestableWidget(SearchPage()));

    expect(searchBar, findsNWidgets(2));
  });

  testWidgets("Show Progress", (WidgetTester tester) async {
    when(() => mockSearchTvSeriesBloc.state).thenReturn(
        const SearchTvSeriesLoading(tvSeriesState: RequestState.Loading));

    final progress = find.byType(CircularProgressIndicator);
    await tester.pumpWidget(_makeTestableWidget(SearchPage(
      isSearch: true,
    )));

    expect(progress, findsOneWidget);
  });

  testWidgets("Show list tv series", (WidgetTester tester) async {
    when(() => mockSearchTvSeriesBloc.state)
        .thenReturn(SearchTvSeriesHasData(<TvSeries>[testTvSeries]));

    final listView = find.byType(ListView);
    final container = find.byKey(Key("container-tv-series"));
    await tester.pumpWidget(_makeTestableWidget(SearchPage(
      isSearch: true,
    )));

    expect(listView, findsOneWidget);
    expect(container, findsOneWidget);
  });
  //
  testWidgets("Show empty tv series", (WidgetTester tester) async {
    when(() => mockSearchTvSeriesBloc.state)
        .thenReturn(const SearchTvSeriesLoading(tvSeriesState: RequestState.Empty));

    final container = find.byKey(Key("container-tv-series-empty"));
    await tester.pumpWidget(_makeTestableWidget(SearchPage(
      isSearch: true,
    )));

    expect(container, findsOneWidget);
  });

  testWidgets("Show Progress movie", (WidgetTester tester) async {
    when(() => mockSearchMovieBloc.state).thenReturn(const SearchMovieLoading(movieState: RequestState.Loading));

    final progress = find.byType(CircularProgressIndicator);
    await tester.pumpWidget(_makeTestableWidget(SearchPage(
      isSearch: true,
      typeSelected: SearchType.MOVIE,
    )));

    expect(progress, findsOneWidget);
  });

  testWidgets("Show list movie", (WidgetTester tester) async {
    when(() => mockSearchMovieBloc.state).thenReturn(SearchMovieHasData(<Movie>[testMovie]));

    final listView = find.byType(ListView);
    final container = find.byKey(Key("container-movie"));
    await tester.pumpWidget(_makeTestableWidget(SearchPage(
      isSearch: true,
      typeSelected: SearchType.MOVIE,
    )));

    expect(listView, findsOneWidget);
    expect(container, findsOneWidget);
  });
  //
  testWidgets("Show empty movie", (WidgetTester tester) async {
    when(() => mockSearchMovieBloc.state).thenReturn(const SearchMovieLoading(movieState: RequestState.Empty));

    final container = find.byKey(Key("container-movie-empty"));
    await tester.pumpWidget(_makeTestableWidget(SearchPage(
      isSearch: true,
      typeSelected: SearchType.MOVIE,
    )));

    expect(container, findsOneWidget);
  });

  testWidgets("Show default section", (WidgetTester tester) async {
    final container = find.byKey(Key("container-default"));
    await tester.pumpWidget(_makeTestableWidget(SearchPage(
      isSearch: false,
    )));

    expect(container, findsOneWidget);
  });
}
