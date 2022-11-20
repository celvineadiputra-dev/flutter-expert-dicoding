import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_state.dart';
import 'package:movie/presentation/pages/top_rated_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/mock_movie_top_rated.dart';

void main() {
  late MockMovieListTopRatedBloc mockMovieListTopRatedBloc;

  setUp(() {
    registerFallbackValue(MockMovieListTopRatedEvent());
    registerFallbackValue(MockMovieListTopRatedState());
    mockMovieListTopRatedBloc = MockMovieListTopRatedBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
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

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(MovieListTopRatedLoading(state: RequestState.Loading));

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display when data is loaded',
      (WidgetTester tester) async {
    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(MovieListTopRatedHasData(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockMovieListTopRatedBloc.state)
        .thenReturn(const MovieListTopRatedError(message: "Error"));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
