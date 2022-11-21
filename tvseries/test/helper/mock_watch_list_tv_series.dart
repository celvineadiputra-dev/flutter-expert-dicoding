import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_event.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_state.dart';

class MockWatchListEvent extends Fake implements WatchListTvSeriesEvent {}

class MockWatchListState extends Fake implements WatchListTvSeriesState {}

class MockWatchListBloc extends MockBloc<WatchListTvSeriesEvent, WatchListTvSeriesState>
    implements WatchListTvSeriesBloc {}
