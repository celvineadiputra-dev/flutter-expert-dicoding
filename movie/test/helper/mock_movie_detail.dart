import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_event.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_state.dart';

class MockMovieDetailEvent extends Fake implements MovieDetailEvent {}

class MockMovieDetailState extends Fake implements MovieDetailState {}

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}
