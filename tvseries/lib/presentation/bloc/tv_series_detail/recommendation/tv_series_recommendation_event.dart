import 'package:equatable/equatable.dart';

abstract class TvSeriesRecommendationEvent extends Equatable {
  const TvSeriesRecommendationEvent();

  @override
  List<Object?> get props => [];
}

class FetchTvSeriesRecommendation extends TvSeriesRecommendationEvent {
  final int id;

  const FetchTvSeriesRecommendation({required this.id});

  @override
  List<Object?> get props => [];
}