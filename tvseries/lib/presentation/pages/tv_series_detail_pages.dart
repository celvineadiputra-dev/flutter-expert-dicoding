import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/detail/tv_series_detail_state.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_detail/recommendation/tv_series_recommendation_state.dart';

import '../../domain/entities/tv_series_detail.dart';
import '../bloc/watch_list/process/watchlist_process_bloc.dart';
import '../bloc/watch_list/process/watchlist_process_event.dart';
import '../bloc/watch_list/process/watchlist_process_state.dart';

class TvSeriesDetailPage extends StatefulWidget {
  final int id;

  const TvSeriesDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<TvSeriesDetailPage> createState() => _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState extends State<TvSeriesDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<TvSeriesDetailBloc>().add(FetchTvSeriesDetail(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvSeriesDetailBloc, TvSeriesDetailState>(
        builder: (context, data) {
          if (data is TvSeriesDetailLoading) {
            if (data.state == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Empty) {
              return const Center(
                child: Text("Empty"),
              );
            }
          } else if (data is TvSeriesDetailHasData) {
            final detail = data.result;
            return SafeArea(child: DetailContent(detail, widget.id));
          } else if (data is TvSeriesDetailError) {
            return Text(data.message);
          }

          return Expanded(child: Container());
        },
      ),
    );
  }
}

class DetailContent extends StatefulWidget {
  final TvSeriesDetail data;

  final int id;

  DetailContent(this.data, this.id);

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  @override
  void initState() {
    super.initState();

    context
        .read<TvSeriesRecommendationBloc>()
        .add(FetchTvSeriesRecommendation(id: widget.id));

    context.read<WatchlistTvSeriesProcessBloc>().add(FetchStatusWatchList(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isAdded = context.select<WatchlistTvSeriesProcessBloc, bool>((value) {
      if (value.state is WatchlistProcessIsAdded) {
        return (value.state as WatchlistProcessIsAdded).result;
      } else {
        return false;
      }
    });

    return Stack(
      key: const Key("stack-detail"),
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${widget.data.posterPath}',
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
                              key: const Key("title"),
                              widget.data.originalName,
                              style: kHeading5,
                            ),
                            Watchlist(tvSeries: widget.data, isAdded: isAdded),
                            Text(
                              key: const Key("genre"),
                              _showGenres(widget.data.genres),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.data.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${widget.data.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              key: const Key("overView"),
                              widget.data.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Seasons',
                              style: kHeading6,
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                key: const Key("listViewSeasons"),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final season = widget.data.seasons![index];
                                  return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: ClipRRect(
                                              key: const Key("image-season"),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${season.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.movie,
                                                size: 15,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${widget.data.numberOfEpisodes} Episodes",
                                                style: kHeading6.copyWith(
                                                    fontSize: 12),
                                              )
                                            ],
                                          )
                                        ],
                                      ));
                                },
                                itemCount: widget.data.seasons!.length,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<TvSeriesRecommendationBloc,
                                TvSeriesRecommendationState>(
                              builder: (context, data) {
                                if (data is TvSeriesRecommendationLoading) {
                                  if (data.state == RequestState.Loading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (data.state == RequestState.Empty) {
                                    return const Center(
                                      child: Text("Empty"),
                                    );
                                  }
                                } else if (data
                                    is TvSeriesRecommendationError) {
                                  return Text(data.message);
                                } else if (data
                                    is TvSeriesRecommendationHasData) {
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      key: const Key("listViewRecommendation"),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final recommendation =
                                            data.result[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                tvSeriesDetailRoute,
                                                arguments: recommendation.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              key: const Key(
                                                  'image-recommendation'),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${recommendation.posterPath}',
                                                placeholder: (context, url) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: data.result.length,
                                    ),
                                  );
                                } else {
                                  return Container(
                                    key: const Key("empty-recommendation"),
                                  );
                                }
                                return Container();
                              },
                            )
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
  final TvSeriesDetail tvSeries;
  final bool isAdded;

  const Watchlist({Key? key, required this.tvSeries, required this.isAdded})
      : super(key: key);

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  late bool isAdded = widget.isAdded;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistTvSeriesProcessBloc, WatchlistProcessState>(
        builder: (context, data) {
      return ElevatedButton(
        onPressed: () async {
          if (!isAdded) {
            context
                .read<WatchlistTvSeriesProcessBloc>()
                .add(AddToWatchList(widget.tvSeries));
          } else {
            context
                .read<WatchlistTvSeriesProcessBloc>()
                .add(RemoveFromWatchList(widget.tvSeries));
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
