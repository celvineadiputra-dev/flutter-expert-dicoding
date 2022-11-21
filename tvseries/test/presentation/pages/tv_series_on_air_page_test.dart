import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_state.dart';
import 'package:tvseries/presentation/pages/tv_series_on_air_page.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/mock_tv_series_list_now_playing.dart';

void main() {
  late MockTvSeriesNowPlayingBloc mockTvSeriesNowPlayingBloc;

  setUp(() {
    registerFallbackValue(MockTvSeriesNowPlayingEvent());
    registerFallbackValue(MockTvSeriesNowPlayingState());
    mockTvSeriesNowPlayingBloc = MockTvSeriesNowPlayingBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TvSeriesNowPlayingBloc>(
            create: (_) => mockTvSeriesNowPlayingBloc,
          ),
        ],
        child: Builder(
          builder: (_) => MaterialApp(
            home: body,
          ),
        ));
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state).thenReturn(
        const TvSeriesNowPlayingLoading(state: RequestState.Loading));

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesOnAirPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state)
        .thenReturn(TvSeriesNowPlayingHasData(result: [testTvSeries]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesOnAirPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockTvSeriesNowPlayingBloc.state)
        .thenReturn(const TvSeriesNowPlayingError(message: "Error"));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesOnAirPage()));

    expect(textFinder, findsOneWidget);
  });
}
