import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/domain/usecases/get_popular_tv_series.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_state.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_state.dart';

import '../../../../domain/usecases/get_top_rated_tv_series.dart';

class TvSeriesTopRatedBloc
    extends Bloc<TvSeriesTopRatedEvent, TvSeriesTopRatedState> {
  final GetTopRatedTvSeries _topRatedTvSeries;

  TvSeriesTopRatedBloc(this._topRatedTvSeries)
      : super(const TvSeriesTopRatedLoading()) {
    on<FetchTopRatedTvSeries>((event, emit) async {
      emit(const TvSeriesTopRatedLoading(state: RequestState.Loading));

      final result = await _topRatedTvSeries.execute();

      result.fold((failure) {
        emit(TvSeriesTopRatedError(message: failure.message));
      }, (data) {
        if (data.isNotEmpty) {
          emit(TvSeriesTopRatedHasData(result: data));
        } else {
          emit(const TvSeriesTopRatedLoading(state: RequestState.Empty));
        }
      });
    });
  }
}
