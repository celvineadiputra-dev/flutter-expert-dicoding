import 'package:equatable/equatable.dart';

abstract class TvSeriesPopularEvent extends Equatable {
  const TvSeriesPopularEvent();

  @override
  List<Object?> get props => [];
}

class FetchPopularTvSeries extends TvSeriesPopularEvent {
  @override
  List<Object> get props => [];
}
