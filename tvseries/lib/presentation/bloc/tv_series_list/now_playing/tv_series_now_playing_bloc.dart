import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/domain/usecases/get_now_playing_tv_series.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_state.dart';

class TvSeriesNowPlayingBloc
    extends Bloc<TvSeriesNowPlayingEvent, TvSeriesNowPlayingState> {
  final GetNowPlayingTvSeries _nowPlayingTvSeries;

  TvSeriesNowPlayingBloc(this._nowPlayingTvSeries)
      : super(const TvSeriesNowPlayingLoading()) {
    on<FetchNowPlayingTvSeries>((event, emit) async {
      emit(const TvSeriesNowPlayingLoading(state: RequestState.Loading));

      final result = await _nowPlayingTvSeries.execute();

      result.fold((failure) {
        emit(TvSeriesNowPlayingError(message: failure.message));
      }, (data) {
        if (data.isNotEmpty) {
          emit(TvSeriesNowPlayingHasData(result: data));
        } else {
          emit(const TvSeriesNowPlayingLoading(state: RequestState.Empty));
        }
      });
    });
  }
}
