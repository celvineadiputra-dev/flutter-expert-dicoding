import 'package:core/utils/http_custom.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/data/datasources/db/database_movie_helper.dart';
import 'package:movie/data/datasources/movie_local_data_source.dart';
import 'package:movie/data/datasources/movie_remote_data_source.dart';
import 'package:movie/data/repositories/movie_repository_impl.dart';
import 'package:movie/domain/repositories/movie_repository.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';
import 'package:movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/domain/usecases/get_watchlist_movies.dart';
import 'package:movie/domain/usecases/get_watchlist_status.dart';
import 'package:movie/domain/usecases/remove_watchlist.dart';
import 'package:movie/domain/usecases/save_watchlist.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:search/domain/usecases/search_tv_series.dart';
import 'package:search/presentation/bloc/search_movie_bloc.dart';
import 'package:search/presentation/bloc/search_tv_series_bloc.dart';
import 'package:tvseries/data/datasources/db/database_tv_series_helper.dart';
import 'package:tvseries/data/datasources/tv_series_local_data_source.dart';
import 'package:tvseries/data/datasources/tv_series_remote_data_source.dart';
import 'package:tvseries/data/repositories/tv_series_repository_impl.dart';
import 'package:tvseries/domain/repositories/tv_series_repository.dart';
import 'package:tvseries/domain/usecases/get_now_playing_tv_series.dart';
import 'package:tvseries/domain/usecases/get_popular_tv_series.dart';
import 'package:tvseries/domain/usecases/get_top_rated_tv_series.dart';
import 'package:tvseries/domain/usecases/get_tv_series_detail.dart';
import 'package:tvseries/domain/usecases/get_tv_series_recommendations.dart';
import 'package:tvseries/domain/usecases/get_tv_series_watch_list_status.dart';
import 'package:tvseries/domain/usecases/get_watchlist_tv_series.dart';
import 'package:tvseries/domain/usecases/remove_tv_series_watchlist.dart';
import 'package:tvseries/domain/usecases/save_tv_series_watchlist.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieListNowPlayingBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieListPopularBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieListTopRatedBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistProcessBloc(
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchListBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchTvSeriesBloc(locator()),
  );

  // tv Series
  locator.registerFactory(
    () => TvSeriesNowPlayingBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesPopularBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesTopRatedBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesRecommendationBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchListTvSeriesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistTvSeriesProcessBloc(
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
        () => TvSeriesDetailBloc(
      locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  // tv series
  locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendation(locator()));
  locator.registerLazySingleton(() => SaveTvSeriesWatchList(locator()));
  locator.registerLazySingleton(() => GetTvSeriesWatchListStatus(locator()));
  locator.registerLazySingleton(() => RemoveTvSeriesWatchList(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // tv series
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
        remoteDataSource: locator(), localDataSource: locator()),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseTvSeriesHelper>(
      () => DatabaseTvSeriesHelper());
  locator
      .registerLazySingleton<DatabaseMovieHelper>(() => DatabaseMovieHelper());

  // external
  locator.registerLazySingleton(() => HttpCustom.client);
}
