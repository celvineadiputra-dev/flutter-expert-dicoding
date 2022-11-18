import 'package:core/core.dart';
import 'package:core/firebase_options.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:about/about.dart';
import 'package:ditonton/presentation/pages/home.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_bloc.dart';
import 'package:movie/presentation/pages/home_movie_page.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';
import 'package:movie/presentation/pages/popular_movies_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/pages/home_movie_page.dart';
import 'package:search/presentation/pages/search_page.dart';
import 'package:movie/presentation/pages/top_rated_movies_page.dart';
import 'package:core/presentation/pages/tv_series_detail_pages.dart';
import 'package:core/presentation/pages/tv_series_on_air_page.dart';
import 'package:core/presentation/pages/tv_series_popular_page.dart';
import 'package:core/presentation/pages/tv_series_top_rated_page.dart';
import 'package:movie/presentation/pages/watchlist_movies_page.dart';
import 'package:core/presentation/pages/watchlist_tv_series_page.dart';
import 'package:core/presentation/provider/popular_movies_notifier.dart';
import 'package:core/presentation/provider/top_rated_movies_notifier.dart';
import 'package:core/presentation/provider/tv_series_detail_notifier.dart';
import 'package:core/presentation/provider/tv_series_list_notifier.dart';
import 'package:core/presentation/provider/tv_series_search_notifier.dart';
import 'package:core/presentation/provider/watchlist_movie_notifier.dart';
import 'package:core/presentation/provider/watchlist_tv_series_notifier.dart';
import 'package:search/presentation/bloc/search_movie_bloc.dart';
import 'package:search/presentation/bloc/search_tv_series_bloc.dart';
import 'package:core/utils/http_custom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HttpCustom.init();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieListNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieDetailNotifier>(),
        // ),
        BlocProvider(
          create: (_) => di.locator<SearchMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieListNowPlayingBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieListPopularBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieListTopRatedBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieRecommendationBloc>(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TopRatedMoviesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<PopularMoviesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<WatchlistMovieNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvSeriesListNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvSeriesDetailNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<WatchlistTvSeriesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvSeriesSearchNotifier>(),
        // )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case movieRoute:
              return MaterialPageRoute(builder: (_) => HomePage());
            // case PopularMoviesPage.ROUTE_NAME:
            //   return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            // case TopRatedMoviesPage.ROUTE_NAME:
            //   return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case movieDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case searchRoute:
              return MaterialPageRoute(builder: (_) => SearchPage());
            // case WatchlistMoviesPage.ROUTE_NAME:
            //   return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case aboutRoute:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case TvSeriesOnAirPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TvSeriesOnAirPage());
            case TvSeriesPopularPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TvSeriesPopularPage());
            case TvSeriesTopRatedPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TvSeriesTopRatedPage());
            case TvSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => TvSeriesDetailPage(id: id),
                  settings: settings);
            case WatchListTvSeries.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchListTvSeries());
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
