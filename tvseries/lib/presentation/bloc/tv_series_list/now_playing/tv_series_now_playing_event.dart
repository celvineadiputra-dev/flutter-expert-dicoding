import 'package:equatable/equatable.dart';

abstract class TvSeriesNowPlayingEvent extends Equatable {
  const TvSeriesNowPlayingEvent();

  @override
  List<Object?> get props => [];
}

class FetchNowPlayingTvSeries extends TvSeriesNowPlayingEvent {
  @override
  List<Object> get props => [];
}
