import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/domain/usecases/get_popular_tv_series.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_state.dart';

class TvSeriesPopularBloc
    extends Bloc<TvSeriesPopularEvent, TvSeriesPopularState> {
  final GetPopularTvSeries _popularTvSeries;

  TvSeriesPopularBloc(this._popularTvSeries)
      : super(const TvSeriesPopularLoading()) {
    on<FetchPopularTvSeries>((event, emit) async {
      emit(const TvSeriesPopularLoading(state: RequestState.Loading));

      final result = await _popularTvSeries.execute();

      result.fold((failure) {
        emit(TvSeriesPopularError(message: failure.message));
      }, (data) {
        if (data.isNotEmpty) {
          emit(TvSeriesPopularHasData(result: data));
        } else {
          emit(const TvSeriesPopularLoading(state: RequestState.Empty));
        }
      });
    });
  }
}
