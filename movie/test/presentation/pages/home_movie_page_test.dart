import 'package:core/core.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/presentation/provider/tv_series_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';

@GenerateMocks([TvSeriesListNotifier, MovieListNotifier])
void main() {
  late MockTvSeriesListNotifier mockTvSeriesListNotifier;
  late MockMovieListNotifier mockMovieListNotifier;

  setUp(() {
    mockTvSeriesListNotifier = MockTvSeriesListNotifier();
    mockMovieListNotifier = MockMovieListNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TvSeriesListNotifier>.value(
            value: mockTvSeriesListNotifier),
        ChangeNotifierProvider<MovieListNotifier>.value(
            value: mockMovieListNotifier),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets("Contain App Bar", (WidgetTester test) async {
    when(mockTvSeriesListNotifier.nowPlayingState)
        .thenReturn(RequestState.Empty);
    when(mockTvSeriesListNotifier.popularState).thenReturn(RequestState.Empty);
    when(mockTvSeriesListNotifier.topRatedState).thenReturn(RequestState.Empty);

    when(mockMovieListNotifier.nowPlayingState).thenReturn(RequestState.Empty);
    when(mockMovieListNotifier.popularMoviesState)
        .thenReturn(RequestState.Empty);
    when(mockMovieListNotifier.topRatedMoviesState)
        .thenReturn(RequestState.Empty);

    final image = find.byType(AppBar);

    await test.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(image, findsOneWidget);
  });

  testWidgets("Contain Icon Button", (WidgetTester test) async {
    when(mockTvSeriesListNotifier.nowPlayingState)
        .thenReturn(RequestState.Empty);
    when(mockTvSeriesListNotifier.popularState).thenReturn(RequestState.Empty);
    when(mockTvSeriesListNotifier.topRatedState).thenReturn(RequestState.Empty);

    when(mockMovieListNotifier.nowPlayingState).thenReturn(RequestState.Empty);
    when(mockMovieListNotifier.popularMoviesState)
        .thenReturn(RequestState.Empty);
    when(mockMovieListNotifier.topRatedMoviesState)
        .thenReturn(RequestState.Empty);

    final image = find.byType(IconButton);

    await test.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(image, findsWidgets);
  });

  testWidgets("Contain Circular", (WidgetTester test) async {
    when(mockTvSeriesListNotifier.nowPlayingState)
        .thenReturn(RequestState.Loading);
    when(mockTvSeriesListNotifier.popularState)
        .thenReturn(RequestState.Loading);
    when(mockTvSeriesListNotifier.topRatedState)
        .thenReturn(RequestState.Loading);

    when(mockMovieListNotifier.nowPlayingState)
        .thenReturn(RequestState.Loading);
    when(mockMovieListNotifier.popularMoviesState)
        .thenReturn(RequestState.Loading);
    when(mockMovieListNotifier.topRatedMoviesState)
        .thenReturn(RequestState.Loading);

    final image = find.byType(CircularProgressIndicator);

    await test.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(image, findsWidgets);
  });

  testWidgets("Contain card", (WidgetTester test) async {
    when(mockTvSeriesListNotifier.nowPlayingState)
        .thenReturn(RequestState.Loaded);
    when(mockTvSeriesListNotifier.popularState).thenReturn(RequestState.Loaded);
    when(mockTvSeriesListNotifier.topRatedState)
        .thenReturn(RequestState.Loaded);

    when(mockMovieListNotifier.nowPlayingState).thenReturn(RequestState.Loaded);
    when(mockMovieListNotifier.popularMoviesState)
        .thenReturn(RequestState.Loaded);
    when(mockMovieListNotifier.topRatedMoviesState)
        .thenReturn(RequestState.Loaded);

    when(mockTvSeriesListNotifier.nowPlayingTvSeries)
        .thenReturn(<TvSeries>[testTvSeries]);
    when(mockTvSeriesListNotifier.popularTvSeries)
        .thenReturn(<TvSeries>[testTvSeries]);
    when(mockTvSeriesListNotifier.topRatedTvSeries)
        .thenReturn(<TvSeries>[testTvSeries]);

    when(mockMovieListNotifier.nowPlayingMovies)
        .thenReturn(<Movie>[testMovie]);
    when(mockMovieListNotifier.popularMovies)
        .thenReturn(<Movie>[testMovie]);
    when(mockMovieListNotifier.topRatedMovies)
        .thenReturn(<Movie>[testMovie]);

    final listTvSeries = find.byKey(Key("list-tv-series"));
    final listMovie = find.byKey(Key("list-movie"));
    final listView = find.byType(ListView);
    final text = find.text('See More');

    await test.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(listTvSeries, findsWidgets);
    expect(listMovie, findsWidgets);
    expect(listView, findsWidgets);
    expect(text, findsWidgets);
  });

  testWidgets("Contain card", (WidgetTester test) async {
    when(mockTvSeriesListNotifier.nowPlayingState)
        .thenReturn(RequestState.Empty);
    when(mockTvSeriesListNotifier.popularState).thenReturn(RequestState.Empty);
    when(mockTvSeriesListNotifier.topRatedState)
        .thenReturn(RequestState.Empty);

    when(mockMovieListNotifier.nowPlayingState).thenReturn(RequestState.Empty);
    when(mockMovieListNotifier.popularMoviesState)
        .thenReturn(RequestState.Empty);
    when(mockMovieListNotifier.topRatedMoviesState)
        .thenReturn(RequestState.Empty);

    final text = find.text('Failed');

    await test.pumpWidget(_makeTestableWidget(HomeMoviePage()));

    expect(text, findsWidgets);
  });
}
