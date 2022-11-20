import 'package:core/utils/state_enum.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/tv_series_detail.dart';

abstract class TvSeriesDetailState extends Equatable {
  const TvSeriesDetailState();

  @override
  List<Object?> get props => [];
}

class TvSeriesDetailLoading extends TvSeriesDetailState {
  final RequestState state;

  const TvSeriesDetailLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class TvSeriesDetailError extends TvSeriesDetailState {
  final String message;

  const TvSeriesDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}

class TvSeriesDetailHasData extends TvSeriesDetailState {
  final TvSeriesDetail result;

  const TvSeriesDetailHasData(this.result);

  @override
  List<Object?> get props => [result];
}