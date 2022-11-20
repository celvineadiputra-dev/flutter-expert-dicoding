import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/usecases/get_watchlist_movies.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_event.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_state.dart';

class WatchListTvSeriesBloc extends Bloc<WatchListEvent, WatchListState> {
  final GetWatchlistMovies _getWatchlistMovies;

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
