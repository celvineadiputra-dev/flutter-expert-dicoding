import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:movie/data/datasources/movie_remote_data_source.dart';
import 'package:movie/domain/repositories/movie_repository.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:search/domain/usecases/search_tv_series.dart';
import 'package:tvseries/data/datasources/tv_series_remote_data_source.dart';
import 'package:tvseries/domain/repositories/tv_series_repository.dart';

@GenerateMocks([
  MovieRepository,
  TvSeriesRepository,
  MovieRemoteDataSource,
  TvSeriesRemoteDataSource,
  SearchMovies,
  SearchTvSeries
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main(){}