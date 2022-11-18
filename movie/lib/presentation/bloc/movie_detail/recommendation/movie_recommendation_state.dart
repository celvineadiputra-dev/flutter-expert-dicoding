import 'package:core/utils/state_enum.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie.dart';

abstract class MovieRecommendationState extends Equatable {
  const MovieRecommendationState();

  @override
  List<Object?> get props => [];
}

class MovieRecommendationLoading extends MovieRecommendationState {
  final RequestState state;

  const MovieRecommendationLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class MovieRecommendationError extends MovieRecommendationState {
  final String message;

  const MovieRecommendationError({required this.message});

  @override
  List<Object?> get props => [message];
}

class MovieRecommendationHasData extends MovieRecommendationState {
  final List<Movie> result;

  const MovieRecommendationHasData(this.result);

  @override
  List<Object?> get props => [result];
}
