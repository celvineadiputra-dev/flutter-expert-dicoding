import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_state.dart';
import 'package:tvseries/presentation/pages/tv_series_top_rated_page.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/mock_tv_series_top_rated.dart';

void main() {
  late MockTvSeriesTopRatedBloc mockTvSeriesTopRatedBloc;

  setUp(() {
    registerFallbackValue(MockTvSeriesTopRatedEvent());
    registerFallbackValue(MockTvSeriesTopRatedState());
    mockTvSeriesTopRatedBloc = MockTvSeriesTopRatedBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
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

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(const TvSeriesTopRatedLoading(state: RequestState.Loading));

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesTopRatedPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display when data is loaded',
      (WidgetTester tester) async {
    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(TvSeriesTopRatedHasData(result: [testTvSeries]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesTopRatedPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockTvSeriesTopRatedBloc.state)
        .thenReturn(const TvSeriesTopRatedError(message: "Error"));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(const TvSeriesTopRatedPage()));

    expect(textFinder, findsOneWidget);
  });
}
