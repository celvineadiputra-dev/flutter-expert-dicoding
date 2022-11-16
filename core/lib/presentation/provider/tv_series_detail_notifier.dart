import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/entities/tv_series_detail.dart';
import 'package:core/domain/usecases/get_tv_series_detail.dart';
import 'package:core/domain/usecases/get_tv_series_recommendations.dart';
import 'package:core/domain/usecases/get_tv_series_watch_list_status.dart';
import 'package:core/domain/usecases/remove_tv_series_watchlist.dart';
import 'package:core/domain/usecases/save_tv_series_watchlist.dart';
import 'package:flutter/material.dart';

class TvSeriesDetailNotifier extends ChangeNotifier {
  final GetTvSeriesDetail getTvSeriesDetail;
  final SaveTvSeriesWatchList saveTvSeriesWatchList;
  final GetTvSeriesRecommendation getTvSeriesRecommendation;
  final GetTvSeriesWatchListStatus getTvSeriesWatchListStatus;
  final RemoveTvSeriesWatchList removeTvSeriesWatchList;

  TvSeriesDetailNotifier(
      {required this.getTvSeriesDetail,
      required this.getTvSeriesRecommendation,
      required this.saveTvSeriesWatchList,
      required this.getTvSeriesWatchListStatus,
      required this.removeTvSeriesWatchList});

  late TvSeriesDetail _tvSeriesDetail;
  late List<TvSeries> _tvSeriesRecommendation;

  TvSeriesDetail get tvSeriesDetail => _tvSeriesDetail;

  List<TvSeries> get tvSeriesRecommendation => _tvSeriesRecommendation;

  RequestState _tvSeriesState = RequestState.Empty;
  RequestState _tvSeriesRecommendationState = RequestState.Empty;

  RequestState get tvSeriesState => _tvSeriesState;

  RequestState get tvSeriesRecommendationState => _tvSeriesRecommendationState;

  String _message = '';

  String get message => _message;

  String _watchlistMessage = '';

  String get watchlistMessage => _watchlistMessage;

  bool _isAddedToWatchList = false;

  bool get isAddtedToWatchList => _isAddedToWatchList;

  Future<void> fetchTvSeriesDetail(int id) async {
    _tvSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getTvSeriesDetail.execute(id);
    final recommendationResult = await getTvSeriesRecommendation.execute(id);

    result.fold((failure) {
      _tvSeriesState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _tvSeriesRecommendationState = RequestState.Loading;
      _tvSeriesDetail = data;
      notifyListeners();

      recommendationResult.fold((failure) {
        _tvSeriesRecommendationState = RequestState.Error;
        _message = failure.message;
      }, (recommendation) {
        _tvSeriesRecommendationState = RequestState.Loaded;
        _tvSeriesRecommendation = recommendation;
      });

      _tvSeriesState = RequestState.Loaded;
    });
  }

  Future<void> addWatchList(TvSeriesDetail tvSeriesDetail) async {
    final result = await saveTvSeriesWatchList.execute(tvSeriesDetail);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvSeriesDetail.id);
  }

  Future<void> removeWatchList(TvSeriesDetail tvSeriesDetail) async {
    final result = await removeTvSeriesWatchList.execute(tvSeriesDetail);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvSeriesDetail.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getTvSeriesWatchListStatus.execute(id);
    _isAddedToWatchList = result;
    notifyListeners();
  }
}
