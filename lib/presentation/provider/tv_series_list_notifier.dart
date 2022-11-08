import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_now_playing_tv_series.dart';
import 'package:flutter/cupertino.dart';

class TvSeriesListNotifier extends ChangeNotifier {
  var _nowPlayingTvSeries = <TvSeries>[];

  List<TvSeries> get nowPlayingTvSeries => _nowPlayingTvSeries;

  TvSeriesListNotifier({required this.getNowPlayingTvSeries});

  final GetNowPlayingTvSeries getNowPlayingTvSeries;

  RequestState _nowPlayingState = RequestState.Empty;

  RequestState get nowPlayingState => _nowPlayingState;

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
}
