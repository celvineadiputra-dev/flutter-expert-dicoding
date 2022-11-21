import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:core/firebase_options.dart';
import 'package:core/utils/http_custom.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';
import 'package:movie/presentation/pages/popular_movies_page.dart';
import 'package:movie/presentation/pages/top_rated_movies_page.dart';
import 'package:movie/presentation/pages/watchlist_movies_page.dart';
import 'package:search/presentation/bloc/search_movie_bloc.dart';
import 'package:search/presentation/bloc/search_tv_series_bloc.dart';
import 'package:search/presentation/pages/search_page.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';
import 'package:tvseries/presentation/pages/tv_series_detail_pages.dart';
import 'package:tvseries/presentation/pages/tv_series_on_air_page.dart';
import 'package:tvseries/presentation/pages/tv_series_popular_page.dart';
import 'package:tvseries/presentation/pages/tv_series_top_rated_page.dart';
import 'package:tvseries/presentation/pages/watchlist_tv_series_page.dart';

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
        BlocProvider(
          create: (_) => di.locator<WatchlistProcessBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesNowPlayingBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesPopularBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesTopRatedBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesRecommendationBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchListTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistTvSeriesProcessBloc>(),
        ),
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
            case popularMovieRoute:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case topRatedMovieRoute:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case movieDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case searchRoute:
              return MaterialPageRoute(builder: (_) => SearchPage());
            case aboutRoute:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case nowPlayingTvSeriesRoute:
              return MaterialPageRoute(builder: (_) => TvSeriesOnAirPage());
            case popularTvSeriesRoute:
              return MaterialPageRoute(builder: (_) => TvSeriesPopularPage());
            case topRatedTvSeriesRoute:
              return MaterialPageRoute(builder: (_) => TvSeriesTopRatedPage());
            case watchListTvSeriesRoute:
              return MaterialPageRoute(builder: (_) => WatchListTvSeries());
            case tvSeriesDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => TvSeriesDetailPage(id: id),
                  settings: settings);
            case watchlistMovieRoute:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
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
