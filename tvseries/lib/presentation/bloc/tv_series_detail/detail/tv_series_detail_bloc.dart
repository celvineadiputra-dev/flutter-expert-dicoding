import 'package:core/utils/state_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/domain/usecases/get_tv_series_detail.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_state.dart';

class TvSeriesDetailBloc
    extends Bloc<TvSeriesDetailEvent, TvSeriesDetailState> {
  final GetTvSeriesDetail _tvSeriesDetail;

  TvSeriesDetailBloc(this._tvSeriesDetail)
      : super(const TvSeriesDetailLoading()) {
    on<FetchTvSeriesDetail>((event, emit) async {
      final id = event.id;

      emit(const TvSeriesDetailLoading(state: RequestState.Loading));

      final result = await _tvSeriesDetail.execute(id);

      result.fold(
        (failure) {
          emit(TvSeriesDetailError(message: failure.message));
        },
        (data) {
          emit(TvSeriesDetailHasData(data));
        },
      );
    });
  }
}
