import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/domain/usecases/get_tv_series_watch_list_status.dart';
import 'package:tvseries/domain/usecases/remove_tv_series_watchlist.dart';
import 'package:tvseries/domain/usecases/save_tv_series_watchlist.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_event.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_state.dart';

class WatchlistTvSeriesProcessBloc
    extends Bloc<WatchlistProcessEvent, WatchlistProcessState> {
  final SaveTvSeriesWatchList _saveWatchlist;
  final RemoveTvSeriesWatchList _removeWatchlist;
  final GetTvSeriesWatchListStatus _getWatchListStatus;

  WatchlistTvSeriesProcessBloc(
      this._saveWatchlist, this._removeWatchlist, this._getWatchListStatus)
      : super(const WatchlistProcessLoading()) {
    on<AddToWatchList>((event, emit) async {
      final tvSeries = event.tvSeriesDetail;

      emit(const WatchlistProcessLoading(state: RequestState.Loading));

      final result = await _saveWatchlist.execute(tvSeries);

      result.fold(
        (failure) {
          emit(WatchlistProcessError(message: failure.message));
        },
        (message) async {
          emit(WatchlistProcessMessage(message));
        },
      );
    });

    on<RemoveFromWatchList>((event, emit) async {
      final tvSeries = event.tvSeriesDetail;

      emit(const WatchlistProcessLoading(state: RequestState.Loading));

      final result = await _removeWatchlist.execute(tvSeries);

      result.fold(
        (failure) {
          emit(WatchlistProcessError(message: failure.message));
        },
        (message) {
          emit(WatchlistProcessMessage(message));
        },
      );
    });

    on<FetchStatusWatchList>((event, emit) async {
      final int id = event.id;

      emit(const WatchlistProcessLoading(state: RequestState.Loading));

      final result = await _getWatchListStatus.execute(id);

      emit(WatchlistProcessIsAdded(result));
    });
  }
}
