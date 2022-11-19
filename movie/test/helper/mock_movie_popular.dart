import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_event.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_state.dart';

class MockMovieListPopularEvent extends Fake implements MovieListPopularEvent {}

class MockMovieListPopularState extends Fake implements MovieListPopularState {}

class MockMovieListPopularBloc extends Fake implements MovieListPopularBloc {}
