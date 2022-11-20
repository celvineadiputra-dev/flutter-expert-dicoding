import 'package:core/utils/state_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:tvseries/domain/entities/tv_series.dart';

abstract class WatchListTvSeriesState extends Equatable {
  const WatchListTvSeriesState();

  @override
  List<Object?> get props => [];
}

class WatchListLoading extends WatchListTvSeriesState {
  final RequestState state;

  const WatchListLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class WatchListError extends WatchListTvSeriesState {
  final String message;

  const WatchListError({required this.message});

  @override
  List<Object?> get props => [message];
}

class WatchListHasData extends WatchListTvSeriesState {
  final List<TvSeries> result;

  const WatchListHasData(this.result);

  @override
  List<Object?> get props => [result];
}
