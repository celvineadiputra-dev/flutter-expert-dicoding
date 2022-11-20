import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:tvseries/domain/entities/tv_series.dart';

abstract class TvSeriesNowPlayingState extends Equatable {
  const TvSeriesNowPlayingState();

  @override
  List<Object?> get props => [];
}

class TvSeriesNowPlayingLoading extends TvSeriesNowPlayingState {
  final RequestState state;

  const TvSeriesNowPlayingLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class TvSeriesNowPlayingError extends TvSeriesNowPlayingState {
  final String message;

  const TvSeriesNowPlayingError({required this.message});

  @override
  List<Object?> get props => [message];
}

class TvSeriesNowPlayingHasData extends TvSeriesNowPlayingState {
  final List<TvSeries> result;

  const TvSeriesNowPlayingHasData({required this.result});

  @override
  List<Object?> get props => [result];
}
