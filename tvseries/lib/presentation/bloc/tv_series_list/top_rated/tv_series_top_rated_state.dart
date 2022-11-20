import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:tvseries/domain/entities/tv_series.dart';

abstract class TvSeriesTopRatedState extends Equatable {
  const TvSeriesTopRatedState();

  @override
  List<Object?> get props => [];
}

class TvSeriesTopRatedLoading extends TvSeriesTopRatedState {
  final RequestState state;

  const TvSeriesTopRatedLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class TvSeriesTopRatedError extends TvSeriesTopRatedState {
  final String message;

  const TvSeriesTopRatedError({required this.message});

  @override
  List<Object?> get props => [message];
}

class TvSeriesTopRatedHasData extends TvSeriesTopRatedState {
  final List<TvSeries> result;

  const TvSeriesTopRatedHasData({required this.result});

  @override
  List<Object?> get props => [result];
}
