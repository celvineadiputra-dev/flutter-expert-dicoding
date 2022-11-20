import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:tvseries/domain/entities/tv_series.dart';

abstract class TvSeriesPopularState extends Equatable {
  const TvSeriesPopularState();

  @override
  List<Object?> get props => [];
}

class TvSeriesPopularLoading extends TvSeriesPopularState {
  final RequestState state;

  const TvSeriesPopularLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class TvSeriesPopularError extends TvSeriesPopularState {
  final String message;

  const TvSeriesPopularError({required this.message});

  @override
  List<Object?> get props => [message];
}

class TvSeriesPopularHasData extends TvSeriesPopularState {
  final List<TvSeries> result;

  const TvSeriesPopularHasData({required this.result});

  @override
  List<Object?> get props => [result];
}
