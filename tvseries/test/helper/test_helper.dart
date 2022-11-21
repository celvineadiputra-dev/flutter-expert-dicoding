import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tvseries/data/datasources/tv_series_local_data_source.dart';
import 'package:tvseries/data/datasources/tv_series_remote_data_source.dart';
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

@GenerateMocks([
  TvSeriesRepository,
  TvSeriesLocalDataSource,
  TvSeriesRemoteDataSource,
  GetNowPlayingTvSeries,
  GetPopularTvSeries,
  GetTopRatedTvSeries,
  GetTvSeriesDetail,
  GetTvSeriesRecommendation,
  GetTvSeriesWatchListStatus,
  GetWatchlistTvSeries,
  RemoveTvSeriesWatchList,
  SaveTvSeriesWatchList,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
