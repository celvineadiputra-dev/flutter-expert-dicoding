import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_event.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_state.dart';

class MockMovieRecommendationEvent extends Fake implements MovieRecommendationEvent {}

class MockMovieRecommendationState extends Fake
    implements MovieRecommendationState {}

class MockMovieRecommendationBloc extends Fake
    implements MovieRecommendationBloc {}
