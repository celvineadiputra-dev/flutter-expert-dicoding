import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/entities/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_event.dart';
import 'package:movie/presentation/bloc/movie_detail/detail/movie_detail_state.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_event.dart';
import 'package:movie/presentation/bloc/movie_detail/recommendation/movie_recommendation_state.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_bloc.dart';
import 'package:movie/presentation/bloc/watch_list/process/watchlist_process_event.dart';

import '../bloc/watch_list/process/watchlist_process_state.dart';

class MovieDetailPage extends StatefulWidget {
  final int id;

  const MovieDetailPage({required this.id});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailBloc>().add(FetchMovieDetail(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, data) {
          if (data is MovieDetailLoading) {
            if (data.state == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Empty) {
              return const Center(
                child: Text("Empty"),
              );
            }
          } else if (data is MovieDetailHasData) {
            final movie = data.result;
            return SafeArea(
              child: DetailContent(movie, widget.id),
            );
          } else if (data is MovieDetailError) {
            return Text(data.message);
          }

          return Expanded(child: Container());
        },
      ),
    );
  }
}

class DetailContent extends StatefulWidget {
  final MovieDetail movie;
  final int id;

  DetailContent(this.movie, this.id);

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  @override
  void initState() {
    super.initState();

    context
        .read<MovieRecommendationBloc>()
        .add(FetchRecommendationMovie(id: widget.id));

    context.read<WatchlistProcessBloc>().add(FetchStatusWatchList(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool isAdded = context.select<WatchlistProcessBloc, bool>((value) {
      if (value.state is WatchlistProcessIsAdded) {
        return (value.state as WatchlistProcessIsAdded).result;
      } else {
        return false;
      }
    });

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.movie.title,
                              style: kHeading5,
                            ),
                            Watchlist(
                              movie: widget.movie,
                              isAdded: isAdded,
                            ),
                            Text(
                              _showGenres(widget.movie.genres),
                            ),
                            Text(
                              _showDuration(widget.movie.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${widget.movie.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              widget.movie.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<MovieRecommendationBloc,
                                MovieRecommendationState>(
                              builder: (context, data) {
                                if (data is MovieRecommendationLoading) {
                                  if (data.state == RequestState.Loading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (data.state == RequestState.Empty) {
                                    return const Center(
                                      child: Text("Empty"),
                                    );
                                  }
                                } else if (data is MovieRecommendationError) {
                                  return Text(data.message);
                                } else if (data is MovieRecommendationHasData) {
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final movie = data.result[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                movieDetailRoute,
                                                arguments: movie.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: data.result.length,
                                    ),
                                  );
                                }
                                return Container();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

class Watchlist extends StatefulWidget {
  final MovieDetail movie;
  final bool isAdded;

  const Watchlist({Key? key, required this.movie, required this.isAdded})
      : super(key: key);

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  late bool isAdded = widget.isAdded;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistProcessBloc, WatchlistProcessState>(
        builder: (context, data) {
      return ElevatedButton(
        onPressed: () async {
          if (!isAdded) {
            context
                .read<WatchlistProcessBloc>()
                .add(AddToWatchList(widget.movie));
          } else {
            context
                .read<WatchlistProcessBloc>()
                .add(RemoveFromWatchList(widget.movie));
          }

          setState(() {
            isAdded = !isAdded;
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isAdded ? const Icon(Icons.check) : const Icon(Icons.add),
            const Text('Watchlist'),
          ],
        ),
      );
    });
  }
}
