import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search/presentation/bloc/search_movie_bloc.dart';
import 'package:search/presentation/bloc/search_movie_event.dart';
import 'package:search/presentation/bloc/search_movie_state.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/mock_search_movie.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockSearchMovies mockSearchMovies;
  late SearchMovieBloc searchMovieBloc;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    searchMovieBloc = SearchMovieBloc(mockSearchMovies);
  });

  final tMovieModel = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tMovieList = <Movie>[tMovieModel];
  const tQuery = 'spiderman';

  group('search movies', () {
    blocTest<SearchMovieBloc, SearchMovieState>(
        'should change state to loading when usecase is called and gotten data successfully',
        build: () {
          when(mockSearchMovies.execute(tQuery))
              .thenAnswer((_) async => Right(tMovieList));

          return searchMovieBloc;
        },
        wait: const Duration(seconds: 2),
        act: (bloc) {
          return bloc.add(const QuerySearchMovie(tQuery));
        },
        expect: () {
          return [
            const SearchMovieLoading(movieState: RequestState.Loading),
            SearchMovieHasData(testMovieList)
          ];
        });

    blocTest<SearchMovieBloc, SearchMovieState>(
        'should return error when data is unsuccessful',
        build: () {
          when(mockSearchMovies.execute(tQuery))
              .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
          return searchMovieBloc;
        },
        wait: const Duration(seconds: 2),
        act: (bloc) {
          return bloc.add(const QuerySearchMovie(tQuery));
        },
        expect: () {
          return [
            const SearchMovieLoading(movieState: RequestState.Loading),
            const SearchMovieError('Server Failure')
          ];
        });

    blocTest<SearchMovieBloc, SearchMovieState>(
        'should return error when data is empty',
        build: () {
          when(mockSearchMovies.execute(tQuery))
              .thenAnswer((_) async => Right([]));
          return searchMovieBloc;
        },
        wait: const Duration(seconds: 2),
        act: (bloc) {
          return bloc.add(const QuerySearchMovie(tQuery));
        },
        expect: () {
          return [
            const SearchMovieLoading(movieState: RequestState.Loading),
            const SearchMovieLoading(movieState: RequestState.Empty)
          ];
        });
  });
}
