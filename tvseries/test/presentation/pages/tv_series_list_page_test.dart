import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_state.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_state.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_state.dart';
import 'package:tvseries/presentation/pages/tv_series_list_page.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/mock_tv_series_list_now_playing.dart';
import '../../helper/mock_tv_series_popular.dart';
import '../../helper/mock_tv_series_top_rated.dart';

void main() {
  late MockTvSeriesNowPlayingBloc mockTvSeriesNowPlayingBloc;
  late MockTvSeriesPopularBloc mockTvSeriesPopularBloc;
  late MockTvSeriesTopRatedBloc mockTvSeriesTopRatedBloc;

  setUp(() {
    registerFallbackValue(MockTvSeriesNowPlayingEvent());
    registerFallbackValue(MockTvSeriesNowPlayingState());
    mockTvSeriesNowPlayingBloc = MockTvSeriesNowPlayingBloc();

    registerFallbackValue(MockTvSeriesPopularEvent());
    registerFallbackValue(MockTvSeriesPopularState());
    mockTvSeriesPopularBloc = MockTvSeriesPopularBloc();

    registerFallbackValue(MockTvSeriesTopRatedEvent());
    registerFallbackValue(MockTvSeriesTopRatedState());
    mockTvSeriesTopRatedBloc = MockTvSeriesTopRatedBloc();

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  tearDown(() {
    mockTvSeriesNowPlayingBloc.close();
    mockTvSeriesPopularBloc.close();
    mockTvSeriesTopRatedBloc.close();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TvSeriesNowPlayingBloc>(
            create: (_) => mockTvSeriesNowPlayingBloc,
          ),
          BlocProvider<TvSeriesPopularBloc>(
            create: (_) => mockTvSeriesPopularBloc,
          ),
          BlocProvider<TvSeriesTopRatedBloc>(
            create: (_) => mockTvSeriesTopRatedBloc,
          ),
        ],
        child: Builder(
          builder: (_) => MaterialApp(
            home: body,
          ),
        ));
  }

  testWidgets("Contain Text Now Playing TvSeriess", (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state)
        .thenReturn(const TvSeriesNowPlayingLoading(state: RequestState.Loading));

    when(() => mockTvSeriesPopularBloc.state)
        .thenReturn(const TvSeriesPopularLoading(state: RequestState.Loading));

    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(const TvSeriesTopRatedLoading(state: RequestState.Loading));

    final text = find.text("Now Playing Tv Series");

    await tester.pumpWidget(_makeTestableWidget(TvSeriesListPage()));

    expect(text, findsOneWidget);
  });

  testWidgets("Contain Text Popular TvSeries", (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state)
        .thenReturn(const TvSeriesNowPlayingLoading(state: RequestState.Loading));

    when(() => mockTvSeriesPopularBloc.state)
        .thenReturn(const TvSeriesPopularLoading(state: RequestState.Loading));

    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(const TvSeriesTopRatedLoading(state: RequestState.Loading));

    final text = find.text("Popular Tv Series");

    await tester.pumpWidget(_makeTestableWidget(TvSeriesListPage()));

    expect(text, findsOneWidget);
  });

  testWidgets("Contain Text Top Rated TvSeries", (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state)
        .thenReturn(const TvSeriesNowPlayingLoading(state: RequestState.Loading));

    when(() => mockTvSeriesPopularBloc.state)
        .thenReturn(const TvSeriesPopularLoading(state: RequestState.Loading));

    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(const TvSeriesTopRatedLoading(state: RequestState.Loading));

    final text = find.text("Top Rated Tv Series");

    await tester.pumpWidget(_makeTestableWidget(TvSeriesListPage()));

    expect(text, findsOneWidget);
  });

  testWidgets("Contain Loading", (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state)
        .thenReturn(const TvSeriesNowPlayingLoading(state: RequestState.Loading));

    when(() => mockTvSeriesPopularBloc.state)
        .thenReturn(const TvSeriesPopularLoading(state: RequestState.Loading));

    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(const TvSeriesTopRatedLoading(state: RequestState.Loading));

    final loading = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesListPage()));

    expect(loading, findsWidgets);
  });

  testWidgets("Contain List View", (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state)
        .thenReturn(TvSeriesNowPlayingHasData(result: [testTvSeries]));

    when(() => mockTvSeriesPopularBloc.state)
        .thenReturn(TvSeriesPopularHasData(result: [testTvSeries]));

    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(TvSeriesTopRatedHasData(result : [testTvSeries]));

    final loading = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesListPage()));

    expect(loading, findsWidgets);
  });

  testWidgets("Contain Empty", (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state)
        .thenReturn(const TvSeriesNowPlayingLoading(state: RequestState.Empty));

    when(() => mockTvSeriesPopularBloc.state)
        .thenReturn(const TvSeriesPopularLoading(state: RequestState.Empty));

    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(const TvSeriesTopRatedLoading(state: RequestState.Empty));

    final loading = find.text("Empty");

    await tester.pumpWidget(_makeTestableWidget(TvSeriesListPage()));

    expect(loading, findsNWidgets(3));
  });

  testWidgets("Contain Error", (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state)
        .thenReturn(const TvSeriesNowPlayingError(message: "Error"));

    when(() => mockTvSeriesPopularBloc.state)
        .thenReturn(const TvSeriesPopularError(message: "Error"));

    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(const TvSeriesTopRatedError(message: "Error"));

    final loading = find.text("Failed");

    await tester.pumpWidget(_makeTestableWidget(TvSeriesListPage()));

    expect(loading, findsNWidgets(3));
  });
}
