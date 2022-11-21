import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_event.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_state.dart';

class MockWatchListEvent extends Fake implements WatchListEvent {}

class MockWatchListState extends Fake implements WatchListState {}

class MockWatchListBloc extends MockBloc<WatchListEvent, WatchListState>
    implements WatchListBloc {}
