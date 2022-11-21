import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/domain/usecases/search_tv_series.dart';
import 'package:search/presentation/bloc/search_tv_series_event.dart';
import 'package:search/presentation/bloc/search_tv_series_state.dart';

class SearchTvSeriesBloc
    extends Bloc<SearchTvSeriesEvent, SearchTvSeriesState> {
  final SearchTvSeries _searchTvSeries;

  SearchTvSeriesBloc(this._searchTvSeries)
      : super(const SearchTvSeriesLoading()) {
    on<QuerySearchTvSeries>((event, emit) async {
      final query = event.query;

      emit(const SearchTvSeriesLoading(tvSeriesState: RequestState.Loading));

      final result = await _searchTvSeries.execute(query);

      result.fold(
        (failure) {
          emit(SearchTvSeriesError(failure.message));
        },
        (data) {
          if (data.isNotEmpty) {
            emit(SearchTvSeriesHasData(data));
          } else {
            emit(
                const SearchTvSeriesLoading(tvSeriesState: RequestState.Empty));
          }
        },
      );
    });
  }
}
