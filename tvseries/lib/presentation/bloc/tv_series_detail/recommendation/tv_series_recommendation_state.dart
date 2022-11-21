import 'package:core/utils/state_enum.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/tv_series.dart';

abstract class TvSeriesRecommendationState extends Equatable {
  const TvSeriesRecommendationState();

  @override
  List<Object?> get props => [];
}

class TvSeriesRecommendationLoading extends TvSeriesRecommendationState {
  final RequestState state;

  const TvSeriesRecommendationLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class TvSeriesRecommendationError extends TvSeriesRecommendationState {
  final String message;

  const TvSeriesRecommendationError({required this.message});

  @override
  List<Object?> get props => [message];
}

class TvSeriesRecommendationHasData extends TvSeriesRecommendationState {
  final List<TvSeries> result;

  const TvSeriesRecommendationHasData(this.result);

  @override
  List<Object?> get props => [result];
}