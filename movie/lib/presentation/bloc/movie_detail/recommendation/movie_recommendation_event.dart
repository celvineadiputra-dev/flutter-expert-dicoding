import 'package:equatable/equatable.dart';

abstract class MovieRecommendationEvent extends Equatable {
  const MovieRecommendationEvent();

  @override
  List<Object?> get props => [];
}

class FetchRecommendationMovie extends MovieRecommendationEvent {
  final int id;

  const FetchRecommendationMovie({required this.id});

  @override
  List<Object?> get props => [];
}