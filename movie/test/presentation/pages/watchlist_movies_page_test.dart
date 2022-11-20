import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_state.dart';
import 'package:movie/presentation/pages/watchlist_movies_page.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/mock_watch_list_movie.dart';

void main() {
  late MockWatchListBloc mockWatchListBloc;

  setUp(() {
    registerFallbackValue(MockWatchListEvent());
    registerFallbackValue(MockWatchListState());
    mockWatchListBloc = MockWatchListBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WatchListBloc>(
            create: (_) => mockWatchListBloc,
          ),
        ],
        child: Builder(
          builder: (_) => MaterialApp(
            home: body,
          ),
        ));
  }

  testWidgets("App Bar", (WidgetTester tester) async {
    when(() => mockWatchListBloc.state)
        .thenReturn(const WatchListLoading(state: RequestState.Loading));

    final element = find.byType(AppBar);

    await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

    expect(element, findsOneWidget);
  });

  testWidgets("Loading", (WidgetTester tester) async {
    when(() => mockWatchListBloc.state)
        .thenReturn(const WatchListLoading(state: RequestState.Loading));

    final element = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

    expect(element, findsOneWidget);
  });

  testWidgets("empty", (WidgetTester tester) async {
    when(() => mockWatchListBloc.state)
        .thenReturn(const WatchListLoading(state: RequestState.Empty));

    final element = find.text("Empty");

    await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

    expect(element, findsOneWidget);
  });

  testWidgets("loaded", (WidgetTester tester) async {
    when(() => mockWatchListBloc.state)
        .thenReturn(WatchListHasData(testMovieList));

    final element = find.byType(ListView);
    final key = find.byKey(Key("container-movie"));

    await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));

    expect(element, findsOneWidget);
    expect(key, findsOneWidget);
  });
}
