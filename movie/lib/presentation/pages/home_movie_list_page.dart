import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/now_playing/movie_list_now_playing_state.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_event.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_event.dart';
import 'package:movie/presentation/bloc/movie_list/top_rated/movie_list_top_rated_state.dart';
import '../../domain/entities/movie.dart';
import '../bloc/movie_list/now_playing/movie_list_now_playing_event.dart';
import '../bloc/movie_list/popular/movie_list_popular_state.dart';

class HomeMovieList extends StatefulWidget {
  @override
  State<HomeMovieList> createState() => _HomeMovieListState();
}

class _HomeMovieListState extends State<HomeMovieList> {
  @override
  void initState() {
    super.initState();

    context.read<MovieListNowPlayingBloc>().add(FetchNowPlayingMovies());
    context.read<MovieListPopularBloc>().add(FetchPopularMovies());
    context.read<MovieListTopRatedBloc>().add(FetchTopRatedMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Now Playing Movies",
            style: kHeading6,
          ),
          BlocBuilder<MovieListNowPlayingBloc, MovieListNowPlayingState>(
              builder: (context, data) {
            if (data is MovieListLoading) {
              if (data.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.Empty) {
                return const Center(
                  child: Text("Empty"),
                );
              }
            } else if (data is MovieListHasData) {
              return MovieList(data.result);
            } else {
              return const Text('Failed');
            }
            return Expanded(child: Container());
          }),
          _buildSubHeading(
              title: "Popular Movies",
              onTap: () {
                Navigator.pushNamed(context, popularMovieRoute);
              }),
          BlocBuilder<MovieListPopularBloc, MovieListPopularState>(
              builder: (context, data) {
            if (data is MovieListPopularLoading) {
              if (data.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.Empty) {
                return const Center(
                  child: Text("Empty"),
                );
              }
            } else if (data is MovieListPopularHasData) {
              return MovieList(data.result);
            } else {
              return const Text('Failed');
            }
            return Expanded(child: Container());
          }),
          _buildSubHeading(
              title: "Top Rated Movies",
              onTap: () {
                Navigator.pushNamed(context, topRatedMovieRoute);
              }),
          BlocBuilder<MovieListTopRatedBloc, MovieListTopRatedState>(
              builder: (context, data) {
            if (data is MovieListTopRatedLoading) {
              if (data.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.Empty) {
                return const Center(
                  child: Text("Empty"),
                );
              }
            } else if (data is MovieListTopRatedHasData) {
              return MovieList(data.result);
            } else {
              return const Text('Failed');
            }
            return Expanded(child: Container());
          })
        ],
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key("list-movie"),
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  movieDetailRoute,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
