import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/popular/tv_series_popular_state.dart';

import '../widgets/tv_series_card_list.dart';

class TvSeriesPopularPage extends StatefulWidget {
  const TvSeriesPopularPage({Key? key}) : super(key: key);

  @override
  State<TvSeriesPopularPage> createState() => _TvSeriesPopularPage();
}

class _TvSeriesPopularPage extends State<TvSeriesPopularPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvSeriesPopularBloc>().add(FetchPopularTvSeries());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Tv Series"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<TvSeriesPopularBloc, TvSeriesPopularState>(
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
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.result[index];
                  return TvSeriesCardList(
                    data: tv,
                  );
                },
                itemCount: data.result.length,
              );
            } else if (data is TvSeriesPopularError) {
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
