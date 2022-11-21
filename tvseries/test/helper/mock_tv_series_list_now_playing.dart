import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_state.dart';

class MockTvSeriesNowPlayingEvent extends Fake
    implements TvSeriesNowPlayingEvent {}

class MockTvSeriesNowPlayingState extends Fake
    implements TvSeriesNowPlayingState {}

class MockTvSeriesNowPlayingBloc
    extends MockBloc<TvSeriesNowPlayingEvent, TvSeriesNowPlayingState>
    implements TvSeriesNowPlayingBloc {}
