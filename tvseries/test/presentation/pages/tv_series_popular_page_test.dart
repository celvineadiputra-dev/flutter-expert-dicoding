import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_state.dart';
import 'package:tvseries/presentation/pages/tv_series_popular_page.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/mock_tv_series_popular.dart';

void main() {
  late MockTvSeriesPopularBloc mockTvSeriesPopularBloc;

  setUp(() {
    registerFallbackValue(MockTvSeriesPopularEvent());
    registerFallbackValue(MockTvSeriesPopularState());
    mockTvSeriesPopularBloc = MockTvSeriesPopularBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TvSeriesPopularBloc>(
            create: (_) => mockTvSeriesPopularBloc,
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
        when(() => mockTvSeriesPopularBloc.state)
            .thenReturn(const TvSeriesPopularLoading(state: RequestState.Loading));

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(_makeTestableWidget(const TvSeriesPopularPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        when(() => mockTvSeriesPopularBloc.state)
            .thenReturn(TvSeriesPopularHasData(result: [testTvSeries]));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget(const TvSeriesPopularPage()));

        expect(listViewFinder, findsOneWidget);
      });

  testWidgets('Page should display text with message when Error',
          (WidgetTester tester) async {
        when(() => mockTvSeriesPopularBloc.state)
            .thenReturn(const TvSeriesPopularError(message: "Error"));

        final textFinder = find.byKey(const Key('error_message'));

        await tester.pumpWidget(_makeTestableWidget(const TvSeriesPopularPage()));

        expect(textFinder, findsOneWidget);
      });
}
