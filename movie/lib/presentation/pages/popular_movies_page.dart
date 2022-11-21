import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_event.dart';
import 'package:movie/presentation/bloc/movie_list/popular/movie_list_popular_state.dart';
import 'package:movie/presentation/widgets/movie_card_list.dart';

class PopularMoviesPage extends StatefulWidget {
  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieListPopularBloc>().add(FetchPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MovieListPopularBloc, MovieListPopularState>(
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
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = data.result[index];
                  return MovieCard(movie);
                },
                itemCount: data.result.length,
              );
            } else {
              return const Text(key: Key("error_message"), 'Failed');
            }
            return Expanded(child: Container());
          },
        ),
      ),
    );
  }
}
