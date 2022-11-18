// import 'package:core/core.dart';
// import 'package:core/domain/entities/movie.dart';
// import 'package:core/presentation/pages/watchlist_movies_page.dart';
// import 'package:core/presentation/provider/watchlist_movie_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:provider/provider.dart';
//
// import '../../dummy_data/dummy_objects.dart';
// import 'watchlist_movies_page_test.mocks.dart';
//
// @GenerateMocks([WatchlistMovieNotifier])
// void main() {
//   late MockWatchlistMovieNotifier provider;
//
//   setUp(() {
//     provider = MockWatchlistMovieNotifier();
//   });
//
//   Widget _makeTestableWidget(Widget body) {
//     return ChangeNotifierProvider<WatchlistMovieNotifier>.value(
//       value: provider,
//       child: MaterialApp(
//         home: body,
//       ),
//     );
//   }
//
//   testWidgets("App Bar", (WidgetTester tester) async {
//     when(provider.watchlistState).thenReturn(RequestState.Loading);
//
//     final element = find.byType(AppBar);
//
//     await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
//
//     expect(element, findsOneWidget);
//   });
//
//   testWidgets("Loading", (WidgetTester tester) async {
//     when(provider.watchlistState).thenReturn(RequestState.Loading);
//
//     final element = find.byType(CircularProgressIndicator);
//
//     await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
//
//     expect(element, findsOneWidget);
//   });
//
//   testWidgets("empty", (WidgetTester tester) async {
//     when(provider.watchlistState).thenReturn(RequestState.Empty);
//     when(provider.message).thenReturn("Empty");
//
//     final element = find.byKey(Key("error_message"));
//
//     await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
//
//     expect(element, findsOneWidget);
//   });
//
//   testWidgets("loaded", (WidgetTester tester) async {
//     when(provider.watchlistState).thenReturn(RequestState.Loaded);
//     when(provider.watchlistMovies).thenReturn(<Movie>[testMovie]);
//
//     final element = find.byType(ListView);
//     final key = find.byKey(Key("container-movie"));
//
//     await tester.pumpWidget(_makeTestableWidget(WatchlistMoviesPage()));
//
//     expect(element, findsOneWidget);
//     expect(key, findsOneWidget);
//   });
// }
