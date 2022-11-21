import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/usecases/remove_watchlist.dart';
import 'package:movie/domain/usecases/save_watchlist.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_event.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_state.dart';

import '../../../../domain/usecases/get_watchlist_status.dart';

class WatchlistProcessBloc
    extends Bloc<WatchlistProcessEvent, WatchlistProcessState> {
  final SaveWatchlist _saveWatchlist;
  final RemoveWatchlist _removeWatchlist;
  final GetWatchListStatus _getWatchListStatus;

  WatchlistProcessBloc(
      this._saveWatchlist, this._removeWatchlist, this._getWatchListStatus)
      : super(const WatchlistProcessLoading()) {
    on<AddToWatchList>((event, emit) async {
      final movie = event.movieDetail;

      emit(const WatchlistProcessLoading(state: RequestState.Loading));

      final result = await _saveWatchlist.execute(movie);

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
      final movie = event.movieDetail;

      emit(const WatchlistProcessLoading(state: RequestState.Loading));

      final result = await _removeWatchlist.execute(movie);

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
