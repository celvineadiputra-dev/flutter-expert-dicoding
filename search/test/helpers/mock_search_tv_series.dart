import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search/presentation/bloc/search_tv_series_bloc.dart';
import 'package:search/presentation/bloc/search_tv_series_event.dart';
import 'package:search/presentation/bloc/search_tv_series_state.dart';

class MockSearchTvSeriesEvent extends Fake implements SearchTvSeriesEvent {}

class MockSearchTvSeriesState extends Fake implements SearchTvSeriesState {}

class MockSearchTvSeriesBloc
    extends MockBloc<SearchTvSeriesEvent, SearchTvSeriesState>
    implements SearchTvSeriesBloc {}
