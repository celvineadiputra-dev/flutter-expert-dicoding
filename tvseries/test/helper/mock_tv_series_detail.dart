import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_state.dart';

class MockTvSeriesDetailEvent extends Fake implements TvSeriesDetailEvent {}

class MockTvSeriesDetailState extends Fake implements TvSeriesDetailState {}

class MockTvSeriesDetailBloc extends MockBloc<TvSeriesDetailEvent, TvSeriesDetailState>
    implements TvSeriesDetailBloc {}
