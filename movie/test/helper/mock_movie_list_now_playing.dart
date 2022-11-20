import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_event.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_state.dart';

class MockMovieListNowPlayingEvent extends Fake implements MovieListEvent {}

class MockMovieListNowPlayingState extends Fake
    implements MovieListNowPlayingState {}

class MockMovieListNowPlayingBloc extends MockBloc<MovieListEvent, MovieListNowPlayingState>
    implements MovieListNowPlayingBloc {}
