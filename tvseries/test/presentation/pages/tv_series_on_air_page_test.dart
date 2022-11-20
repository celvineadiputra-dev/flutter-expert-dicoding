// import 'package:core/core.dart';
// import 'package:core/domain/entities/tv_series.dart';
// import 'package:core/presentation/pages/tv_series_on_air_page.dart';
// import 'package:core/presentation/provider/tv_series_list_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:provider/provider.dart';
//
// import '../../dummy_data/dummy_objects.dart';
// import 'home_movie_page_test.mocks.dart';
//
// @GenerateMocks([TvSeriesListNotifier])
// void main() {
//   late MockTvSeriesListNotifier provider;
//
//   setUp(() {
//     provider = MockTvSeriesListNotifier();
//   });
//
//   Widget _makeTestableWidget(Widget body) {
//     return ChangeNotifierProvider<TvSeriesListNotifier>.value(
//       value: provider,
//       child: MaterialApp(
//         home: body,
//       ),
//     );
//   }
//
//   testWidgets('Page should display center progress bar when loading',
//       (WidgetTester tester) async {
//     when(provider.nowPlayingState).thenReturn(RequestState.Loading);
//
//     final progressBarFinder = find.byType(CircularProgressIndicator);
//     final centerFinder = find.byType(Center);
//
//     await tester.pumpWidget(_makeTestableWidget(TvSeriesOnAirPage()));
//
//     expect(centerFinder, findsOneWidget);
//     expect(progressBarFinder, findsOneWidget);
//   });
//
//   testWidgets('Page should display ListView when data is loaded',
//       (WidgetTester tester) async {
//     when(provider.nowPlayingState).thenReturn(RequestState.Loaded);
//     when(provider.nowPlayingTvSeries).thenReturn(<TvSeries>[testTvSeries]);
//
//     final listViewFinder = find.byType(ListView);
//
//     await tester.pumpWidget(_makeTestableWidget(TvSeriesOnAirPage()));
//
//     expect(listViewFinder, findsOneWidget);
//   });
//
//   testWidgets('Page should display text with message when Error',
//       (WidgetTester tester) async {
//     when(provider.nowPlayingState).thenReturn(RequestState.Error);
//     when(provider.message).thenReturn('Error message');
//
//     final textFinder = find.byKey(Key('error_message'));
//
//     await tester.pumpWidget(_makeTestableWidget(TvSeriesOnAirPage()));
//
//     expect(textFinder, findsOneWidget);
//   });
// }
