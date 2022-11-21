import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_state.dart';

class MockTvSeriesPopularEvent extends Fake implements TvSeriesPopularEvent {}

class MockTvSeriesPopularState extends Fake implements TvSeriesPopularState {}

class MockTvSeriesPopularBloc
    extends MockBloc<TvSeriesPopularEvent, TvSeriesPopularState>
    implements TvSeriesPopularBloc {}
