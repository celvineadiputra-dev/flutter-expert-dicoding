import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/usecases/get_watchlist_tv_series.dart';
import 'package:flutter/cupertino.dart';

class WatchlistTvSeriesNotifier extends ChangeNotifier {
  var _watclist = <TvSeries>[];

  List<TvSeries> get watchlist => _watclist;

  var _watclistState = RequestState.Empty;
  RequestState get watchlistState => _watclistState;

  String _message = "";
  String get message => _message;

  WatchlistTvSeriesNotifier({required this.getWatchlistTvSeries});

  final GetWatchlistTvSeries getWatchlistTvSeries;

  Future<void> fetchWatchlistTvSeries() async {
    _watclistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvSeries.execute();

    result.fold((failure) {
      _watclistState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _watclistState = RequestState.Loaded;
      _watclist = data;
      notifyListeners();
    });
  }
}