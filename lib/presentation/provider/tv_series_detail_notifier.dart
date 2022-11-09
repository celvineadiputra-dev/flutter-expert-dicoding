import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/TvSeriesDetail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:flutter/cupertino.dart';

class TvSeriesDetailNotifier extends ChangeNotifier {
  final GetTvSeriesDetail getTvSeriesDetail;

  TvSeriesDetailNotifier({required this.getTvSeriesDetail});

  late TvSeriesDetail _tvSeriesDetail;

  TvSeriesDetail get tvSeriesDetail => _tvSeriesDetail;

  RequestState _tvSeriesState = RequestState.Empty;

  RequestState get tvSeriesState => _tvSeriesState;

  String _message = '';

  String get message => _message;

  Future<void> fetchTvSeriesDetail(int id) async {
    _tvSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getTvSeriesDetail.execute(id);

    result.fold((failure) {
      _tvSeriesState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _tvSeriesState = RequestState.Loaded;
      _tvSeriesDetail = data;
      notifyListeners();
    });
  }
}
