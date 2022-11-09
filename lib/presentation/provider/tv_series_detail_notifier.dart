import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/TvSeriesDetail.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:flutter/cupertino.dart';

class TvSeriesDetailNotifier extends ChangeNotifier {
  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesRecommendation getTvSeriesRecommendation;

  TvSeriesDetailNotifier(
      {required this.getTvSeriesDetail,
      required this.getTvSeriesRecommendation});

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
}
