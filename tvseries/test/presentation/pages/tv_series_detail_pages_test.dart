import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_state.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_state.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_state.dart';
import 'package:tvseries/presentation/pages/tv_series_detail_pages.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/mock_tv_series_detail.dart';
import '../../helper/mock_tv_series_recommendation.dart';
import '../../helper/mock_watchlist_process.dart';

void main() {
  late MockTvSeriesDetailBloc mockTvSeriesDetailBloc;
  late MockWatchlistProcessBloc mockWatchlistProcessBloc;
  late MockTvSeriesRecommendationBloc mockMovieRecommendationBloc;

  setUp(() {
    registerFallbackValue(MockTvSeriesDetailEvent());
    registerFallbackValue(MockTvSeriesDetailState());
    mockTvSeriesDetailBloc = MockTvSeriesDetailBloc();

    registerFallbackValue(MockWatchlistProcessEvent());
    registerFallbackValue(MockWatchlistProcessState());
    mockWatchlistProcessBloc = MockWatchlistProcessBloc();

    registerFallbackValue(MockTvSeriesRecommendationEvent());
    registerFallbackValue(MockTvSeriesRecommendationState());
    mockMovieRecommendationBloc = MockTvSeriesRecommendationBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TvSeriesDetailBloc>(
              create: (_) => mockTvSeriesDetailBloc),
          BlocProvider<WatchlistTvSeriesProcessBloc>(
              create: (_) => mockWatchlistProcessBloc),
          BlocProvider<TvSeriesRecommendationBloc>(
              create: (_) => mockMovieRecommendationBloc),
        ],
        child: MaterialApp(
          home: body,
        ));
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(const TvSeriesDetailLoading(state: RequestState.Loading));
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(TvSeriesDetailHasData(testTvSeriesDetail));
    when(() => mockMovieRecommendationBloc.state).thenReturn(
        const TvSeriesRecommendationLoading(state: RequestState.Empty));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester
        .pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(const TvSeriesDetailLoading(state: RequestState.Loading));
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(TvSeriesDetailHasData(testTvSeriesDetail));
    when(() => mockMovieRecommendationBloc.state).thenReturn(
        const TvSeriesRecommendationLoading(state: RequestState.Empty));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets('Watchlist loading', (WidgetTester tester) async {
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(const TvSeriesDetailLoading(state: RequestState.Loading));
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(TvSeriesDetailHasData(testTvSeriesDetail));
    when(() => mockMovieRecommendationBloc.state).thenReturn(
        const TvSeriesRecommendationLoading(state: RequestState.Empty));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(true));

    final loading = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(loading, findsWidgets);
  });

  testWidgets('Watchlist detail widget', (WidgetTester tester) async {
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(const TvSeriesDetailLoading(state: RequestState.Loading));
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(TvSeriesDetailHasData(testTvSeriesDetail));
    when(() => mockMovieRecommendationBloc.state).thenReturn(
        const TvSeriesRecommendationLoading(state: RequestState.Empty));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(true));

    final image = find.byType(CachedNetworkImage);
    final title = find.byKey(const Key("title"));
    final genre = find.byKey(const Key("genre"));
    final overView = find.byKey(const Key("overView"));
    final RatingBar = find.byType(RatingBarIndicator);

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(image, findsWidgets);
    expect(title, findsOneWidget);
    expect(genre, findsOneWidget);
    expect(overView, findsOneWidget);
    expect(RatingBar, findsOneWidget);
  });

  testWidgets('Watchlist recommendation & seasons', (WidgetTester tester) async {
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(const TvSeriesDetailLoading(state: RequestState.Loading));
    when(() => mockTvSeriesDetailBloc.state)
        .thenReturn(TvSeriesDetailHasData(testTvSeriesDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(TvSeriesRecommendationHasData([testTvSeries]));
    when(() => mockWatchlistProcessBloc.state)
        .thenReturn(const WatchlistProcessIsAdded(true));

    final keySeason = find.byKey(const Key("listViewSeasons"));
    final keyRecommendation = find.byKey(const Key("listViewRecommendation"));

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(keySeason, findsOneWidget);
    expect(keyRecommendation, findsOneWidget);
  });
}
