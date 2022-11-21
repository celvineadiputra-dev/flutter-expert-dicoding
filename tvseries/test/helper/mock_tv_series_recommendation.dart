import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_state.dart';

class MockTvSeriesRecommendationEvent extends Fake
    implements TvSeriesRecommendationEvent {}

class MockTvSeriesRecommendationState extends Fake
    implements TvSeriesRecommendationState {}

class MockTvSeriesRecommendationBloc
    extends MockBloc<TvSeriesRecommendationEvent, TvSeriesRecommendationState>
    implements TvSeriesRecommendationBloc {}
