import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/domain/usecases/get_watchlist_tv_series.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_event.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_state.dart';

class WatchListTvSeriesBloc extends Bloc<WatchListTvSeriesEvent, WatchListTvSeriesState> {
  final GetWatchlistTvSeries _getWatchlistMovies;

  WatchListTvSeriesBloc(this._getWatchlistMovies) : super(const WatchListLoading()) {
    on<FetchAllWatchList>((event, emit) async {
      emit(const WatchListLoading(state: RequestState.Loading));

      final result = await _getWatchlistMovies.execute();

      result.fold(
        (failure) {
          emit(WatchListError(message: failure.message));
        },
        (data) {
          emit(WatchListHasData(data));
        },
      );
    });
  }
}
