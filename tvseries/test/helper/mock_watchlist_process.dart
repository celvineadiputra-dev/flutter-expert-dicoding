import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_event.dart';
import 'package:tvseries/presentation/bloc/watch_list/process/watchlist_process_state.dart';

class MockWatchlistProcessEvent extends Fake implements WatchlistProcessEvent {}

class MockWatchlistProcessState extends Fake implements WatchlistProcessState {}

class MockWatchlistProcessBloc
    extends MockBloc<WatchlistProcessEvent, WatchlistProcessState>
    implements WatchlistTvSeriesProcessBloc {}
