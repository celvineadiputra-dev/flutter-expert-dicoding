import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_state.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_state.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_state.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/mock_movie_detail.dart';
import '../../helper/mock_movie_recommendation.dart';
import '../../helper/mock_watchlist_process.dart';

void main() {
  late MockMovieDetailBloc mockMovieDetailBloc;
  late MockWatchlistProcessBloc mockWatchlistProcessBloc;
  late MockMovieRecommendationBloc mockMovieRecommendationBloc;

  setUp(() {
    registerFallbackValue(MockMovieDetailEvent());
    registerFallbackValue(MockMovieDetailState());
    mockMovieDetailBloc = MockMovieDetailBloc();

    registerFallbackValue(MockWatchlistProcessEvent());
    registerFallbackValue(MockWatchlistProcessState());
    mockWatchlistProcessBloc = MockWatchlistProcessBloc();

    registerFallbackValue(MockMovieRecommendationEvent());
    registerFallbackValue(MockMovieRecommendationState());
    mockMovieRecommendationBloc = MockMovieRecommendationBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailBloc>(create: (_) => mockMovieDetailBloc),
          BlocProvider<WatchlistProcessBloc>(
              create: (_) => mockWatchlistProcessBloc),
          BlocProvider<MovieRecommendationBloc>(
              create: (_) => mockMovieRecommendationBloc),
        ],
        child: MaterialApp(
          home: body,
        ));
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailLoading(state: RequestState.Loading));
    when(() => mockMovieDetailBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state).thenReturn(
        const MovieRecommendationLoading(state: RequestState.Empty));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailLoading(state: RequestState.Loading));
    when(() => mockMovieDetailBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state).thenReturn(
        const MovieRecommendationLoading(state: RequestState.Empty));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('Watchlist loading', (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailLoading(state: RequestState.Loading));
    when(() => mockMovieDetailBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state).thenReturn(
        const MovieRecommendationLoading(state: RequestState.Empty));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(true));

    final loading = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(loading, findsOneWidget);
  });

  testWidgets('Watchlist detail widget', (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailLoading(state: RequestState.Loading));
    when(() => mockMovieDetailBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state).thenReturn(
        const MovieRecommendationLoading(state: RequestState.Empty));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(true));

    final image = find.byType(CachedNetworkImage);
    final title = find.byKey(const Key("title"));
    final genre = find.byKey(const Key("genre"));
    final overView = find.byKey(const Key("overView"));
    final RatingBar = find.byType(RatingBarIndicator);

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(image, findsWidgets);
    expect(title, findsOneWidget);
    expect(genre, findsOneWidget);
    expect(overView, findsOneWidget);
    expect(RatingBar, findsOneWidget);
  });

  testWidgets('Watchlist recommendation', (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailLoading(state: RequestState.Loading));
    when(() => mockMovieDetailBloc.state)
        .thenReturn(MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(MovieRecommendationHasData(testMovieList));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(true));

    final key = find.byKey(const Key("listViewRecommendation"));

    await tester.pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(key, findsOneWidget);
  });
}
