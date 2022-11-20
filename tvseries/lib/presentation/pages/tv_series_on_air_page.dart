import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/now_playing/tv_series_now_playing_state.dart';

import '../widgets/tv_series_card_list.dart';

class TvSeriesOnAirPage extends StatefulWidget {
  const TvSeriesOnAirPage({Key? key}) : super(key: key);

  @override
  State<TvSeriesOnAirPage> createState() => _TvSeriesOnAirPageState();
}

class _TvSeriesOnAirPageState extends State<TvSeriesOnAirPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvSeriesNowPlayingBloc>().add(FetchNowPlayingTvSeries());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Now Playing Tv Series"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<TvSeriesNowPlayingBloc, TvSeriesNowPlayingState>(
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
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.result[index];
                  return TvSeriesCardList(
                    data: tv,
                  );
                },
                itemCount: data.result.length,
              );
            } else if (data is TvSeriesNowPlayingError) {
              return Center(
                key: const Key('error_message'),
                child: Text(data.message),
              );
            }
            return Expanded(child: Container());
          },
        ),
      ),
    );
  }
}
