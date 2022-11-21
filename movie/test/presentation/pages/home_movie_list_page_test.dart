import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_state.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_state.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_state.dart';
import 'package:movie/presentation/pages/home_movie_list_page.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/mock_movie_list_now_playing.dart';
import '../../helper/mock_movie_popular.dart';
import '../../helper/mock_movie_top_rated.dart';

void main() {
  late MockMovieListNowPlayingBloc mockMovieListNowPlayingBloc;
  late MockMovieListPopularBloc mockMovieListPopularBloc;
  late MockMovieListTopRatedBloc mockMovieListTopRatedBloc;

  setUp(() {
    registerFallbackValue(MockMovieListNowPlayingEvent());
    registerFallbackValue(MockMovieListNowPlayingState());
    mockMovieListNowPlayingBloc = MockMovieListNowPlayingBloc();

    registerFallbackValue(MockMovieListPopularEvent());
    registerFallbackValue(MockMovieListPopularState());
    mockMovieListPopularBloc = MockMovieListPopularBloc();

    registerFallbackValue(MockMovieListTopRatedEvent());
    registerFallbackValue(MockMovieListTopRatedState());
    mockMovieListTopRatedBloc = MockMovieListTopRatedBloc();

    TestWidgetsFlutterBinding.ensureInitialized();
  });

  tearDown(() {
    mockMovieListNowPlayingBloc.close();
    mockMovieListPopularBloc.close();
    mockMovieListTopRatedBloc.close();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MovieListNowPlayingBloc>(
            create: (_) => mockMovieListNowPlayingBloc,
          ),
          BlocProvider<MovieListPopularBloc>(
            create: (_) => mockMovieListPopularBloc,
          ),
          BlocProvider<MovieListTopRatedBloc>(
            create: (_) => mockMovieListTopRatedBloc,
          ),
        ],
        child: Builder(
          builder: (_) => MaterialApp(
            home: body,
          ),
        ));
  }

  testWidgets("Contain Text Now Playing Movies", (WidgetTester tester) async {
    when(() => mockMovieListNowPlayingBloc.state)
        .thenReturn(MovieListLoading(state: RequestState.Loading));

    when(() => mockMovieListPopularBloc.state)
        .thenReturn(MovieListPopularLoading(state: RequestState.Loading));

    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(MovieListTopRatedLoading(state: RequestState.Loading));

    final text = find.text("Now Playing Movies");

    await tester.pumpWidget(_makeTestableWidget(HomeMovieList()));

    expect(text, findsOneWidget);
  });

  testWidgets("Contain Text Popular Movies", (WidgetTester tester) async {
    when(() => mockMovieListNowPlayingBloc.state)
        .thenReturn(MovieListLoading(state: RequestState.Loading));

    when(() => mockMovieListPopularBloc.state)
        .thenReturn(MovieListPopularLoading(state: RequestState.Loading));

    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(MovieListTopRatedLoading(state: RequestState.Loading));

    final text = find.text("Popular Movies");

    await tester.pumpWidget(_makeTestableWidget(HomeMovieList()));

    expect(text, findsOneWidget);
  });

  testWidgets("Contain Text Top Rated Movies", (WidgetTester tester) async {
    when(() => mockMovieListNowPlayingBloc.state)
        .thenReturn(MovieListLoading(state: RequestState.Loading));

    when(() => mockMovieListPopularBloc.state)
        .thenReturn(MovieListPopularLoading(state: RequestState.Loading));

    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(MovieListTopRatedLoading(state: RequestState.Loading));

    final text = find.text("Top Rated Movies");

    await tester.pumpWidget(_makeTestableWidget(HomeMovieList()));

    expect(text, findsOneWidget);
  });

  testWidgets("Contain Loading", (WidgetTester tester) async {
    when(() => mockMovieListNowPlayingBloc.state)
        .thenReturn(MovieListLoading(state: RequestState.Loading));

    when(() => mockMovieListPopularBloc.state)
        .thenReturn(MovieListPopularLoading(state: RequestState.Loading));

    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(MovieListTopRatedLoading(state: RequestState.Loading));

    final loading = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(HomeMovieList()));

    expect(loading, findsWidgets);
  });

  testWidgets("Contain List View", (WidgetTester tester) async {
    when(() => mockMovieListNowPlayingBloc.state)
        .thenReturn(MovieListHasData(testMovieList));

    when(() => mockMovieListPopularBloc.state)
        .thenReturn(MovieListPopularHasData(testMovieList));

    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(MovieListTopRatedHasData(testMovieList));

    final loading = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(HomeMovieList()));

    expect(loading, findsWidgets);
  });

  testWidgets("Contain Empty", (WidgetTester tester) async {
    when(() => mockMovieListNowPlayingBloc.state)
        .thenReturn(const MovieListLoading(state: RequestState.Empty));

    when(() => mockMovieListPopularBloc.state)
        .thenReturn(const MovieListPopularLoading(state: RequestState.Empty));

    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(const MovieListTopRatedLoading(state: RequestState.Empty));

    final loading = find.text("Empty");

    await tester.pumpWidget(_makeTestableWidget(HomeMovieList()));

    expect(loading, findsNWidgets(3));
  });

  testWidgets("Contain Error", (WidgetTester tester) async {
    when(() => mockMovieListNowPlayingBloc.state)
        .thenReturn(const MovieListError(message: "Error"));

    when(() => mockMovieListPopularBloc.state)
        .thenReturn(const MovieListPopularError(message: "Error"));

    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(const MovieListTopRatedError(message: "Error"));

    final loading = find.text("Failed");

    await tester.pumpWidget(_makeTestableWidget(HomeMovieList()));

    expect(loading, findsNWidgets(3));
  });
}
