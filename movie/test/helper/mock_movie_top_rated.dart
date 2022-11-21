import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_event.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_state.dart';

class MockMovieListTopRatedEvent extends Fake
    implements MovieListTopRatedEvent {}

class MockMovieListTopRatedState extends Fake
    implements MovieListTopRatedState {}

class MockMovieListTopRatedBloc
    extends MockBloc<MovieListTopRatedEvent, MovieListTopRatedState>
    implements MovieListTopRatedBloc {}
