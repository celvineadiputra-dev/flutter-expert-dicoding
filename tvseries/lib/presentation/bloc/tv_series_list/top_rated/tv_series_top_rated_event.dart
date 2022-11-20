import 'package:equatable/equatable.dart';

abstract class TvSeriesTopRatedEvent extends Equatable {
  const TvSeriesTopRatedEvent();

  @override
  List<Object?> get props => [];
}

class FetchTopRatedTvSeries extends TvSeriesTopRatedEvent {
  @override
  List<Object> get props => [];
}
