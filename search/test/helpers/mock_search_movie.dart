import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search/presentation/bloc/search_movie_bloc.dart';
import 'package:search/presentation/bloc/search_movie_event.dart';
import 'package:search/presentation/bloc/search_movie_state.dart';

class MockSearchMovieEvent extends Fake implements SearchMovieEvent {}

class MockSearchMovieState extends Fake implements SearchMovieState {}

class MockSearchMovieBloc extends MockBloc<SearchMovieEvent, SearchMovieState>
    implements SearchMovieBloc {}
