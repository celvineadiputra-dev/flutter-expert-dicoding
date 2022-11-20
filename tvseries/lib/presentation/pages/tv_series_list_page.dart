import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_state.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_state.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_state.dart';

import '../../domain/entities/tv_series.dart';
import '../bloc/tv_series_list/top_rated/tv_series_top_rated_bloc.dart';

class TvSeriesListPage extends StatefulWidget {
  @override
  State<TvSeriesListPage> createState() => _TvSeriesListPageState();
}

class _TvSeriesListPageState extends State<TvSeriesListPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TvSeriesNowPlayingBloc>().add(FetchNowPlayingTvSeries());
      context.read<TvSeriesPopularBloc>().add(FetchPopularTvSeries());
      context.read<TvSeriesTopRatedBloc>().add(FetchTopRatedTvSeries());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubHeading(title: "Now Playing Tv Series", onTap: () {
            Navigator.pushNamed(context, nowPlayingTvSeriesRoute);
          }),
          BlocBuilder<TvSeriesNowPlayingBloc, TvSeriesNowPlayingState>(
              builder: (context, data) {
            if (data is TvSeriesNowPlayingLoading) {
              if (data.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.Empty) {
                return const Center(
                  child: Text("Empty"),
                );
              }
            } else if (data is TvSeriesNowPlayingHasData) {
              return TvSeriesList(data.result);
            } else {
              return const Text('Failed');
            }
            return Expanded(child: Container());
          }),
          _buildSubHeading(title: "Popular Tv Series", onTap: () {
            Navigator.pushNamed(context, popularTvSeriesRoute);
          }),
          BlocBuilder<TvSeriesPopularBloc, TvSeriesPopularState>(
              builder: (context, data) {
            if (data is TvSeriesPopularLoading) {
              if (data.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.Empty) {
                return const Center(
                  child: Text("Empty"),
                );
              }
            } else if (data is TvSeriesPopularHasData) {
              return TvSeriesList(data.result);
            } else {
              return const Text('Failed');
            }
            return Expanded(child: Container());
          }),
          _buildSubHeading(title: "Top Rated Tv Series", onTap: () {
            Navigator.pushNamed(context, topRatedTvSeriesRoute);
          }),
          BlocBuilder<TvSeriesTopRatedBloc, TvSeriesTopRatedState>(
              builder: (context, data) {
            if (data is TvSeriesTopRatedLoading) {
              if (data.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.Empty) {
                return const Center(
                  child: Text("Empty"),
                );
              }
            } else if (data is TvSeriesTopRatedHasData) {
              return TvSeriesList(data.result);
            } else {
              return const Text('Failed');
            }
            return Expanded(child: Container());
          }),
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
        TextButton(
          onPressed: onTap,
          child: Row(
            children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
          ),
        )
      ],
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvs;

  TvSeriesList(this.tvs);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key("list-tv-series"),
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvs[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  tvSeriesDetailRoute,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvs.length,
      ),
    );
  }
}
