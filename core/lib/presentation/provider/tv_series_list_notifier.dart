import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/usecases/get_now_playing_tv_series.dart';
import 'package:core/domain/usecases/get_popular_tv_series.dart';
import 'package:core/domain/usecases/get_top_rated_tv_series.dart';
import 'package:flutter/cupertino.dart';

class TvSeriesListNotifier extends ChangeNotifier {
  var _nowPlayingTvSeries = <TvSeries>[];

  List<TvSeries> get nowPlayingTvSeries => _nowPlayingTvSeries;

  var _popularTvSeries = <TvSeries>[];

  List<TvSeries> get popularTvSeries => _popularTvSeries;

  var _topRatedTvSeries = <TvSeries>[];

  List<TvSeries> get topRatedTvSeries => _topRatedTvSeries;

  TvSeriesListNotifier(
      {required this.getNowPlayingTvSeries,
      required this.getPopularTvSeries,
      required this.getTopRatedTvSeries});

  final GetNowPlayingTvSeries getNowPlayingTvSeries;
  final GetPopularTvSeries getPopularTvSeries;
  final GetTopRatedTvSeries getTopRatedTvSeries;

  RequestState _nowPlayingState = RequestState.Empty;

  RequestState get nowPlayingState => _nowPlayingState;

  RequestState _popularState = RequestState.Empty;

  RequestState get popularState => _popularState;

  RequestState _topRatedState = RequestState.Empty;

  RequestState get topRatedState => _topRatedState;

  String _message = '';

  String get message => _message;

  Future<void> fetchNowPlayingTvSeries() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvSeries.execute();

    result.fold((failure) {
      _nowPlayingState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _nowPlayingState = RequestState.Loaded;
      _nowPlayingTvSeries = data;
      notifyListeners();
    });
  }

  Future<void> fetchPopularTvSeries() async {
    _popularState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvSeries.execute();

    result.fold((failure) {
      _popularState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _popularState = RequestState.Loaded;
      _popularTvSeries = data;
      notifyListeners();
    });
  }

  Future<void> fetchTopRatedTvSeries() async {
    _topRatedState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvSeries.execute();

    result.fold((failure) {
      _topRatedState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _topRatedState = RequestState.Loaded;
      _topRatedTvSeries = data;
      notifyListeners();
    });
  }
}
