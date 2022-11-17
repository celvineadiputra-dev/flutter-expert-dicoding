import 'package:core/domain/entities/tv_series.dart';
import 'package:core/utils/state_enum.dart';
import 'package:equatable/equatable.dart';

abstract class SearchTvSeriesState extends Equatable{
  const SearchTvSeriesState();

  @override
  List<Object?> get props => [];
}

class SearchTvSeriesLoading extends SearchTvSeriesState {
  final RequestState tvSeriesState;

  const SearchTvSeriesLoading({this.tvSeriesState = RequestState.Empty});

  @override
  List<Object?> get props => [tvSeriesState];
}

class SearchTvSeriesError extends SearchTvSeriesState {
  final String _message;

  const SearchTvSeriesError(this._message);

  List<Object?> get props => [_message];
}

class SearchTvSeriesHasData extends SearchTvSeriesState {
  final List<TvSeries> searchResult;

  const SearchTvSeriesHasData(this.searchResult);

  @override
  List<Object?> get props => [];
}
