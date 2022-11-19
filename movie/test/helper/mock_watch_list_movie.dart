import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_event.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_state.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_event.dart';
import 'package:movie/presentation/bloc/watch_list/list/watch_list_state.dart';

class MockWatchListEvent extends Fake implements WatchListEvent {}

class MockWatchListState extends Fake
    implements WatchListState {}

class MockWatchListBloc extends Fake
    implements WatchListBloc {}
