import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_bloc.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_event.dart';
import 'package:tvseries/presentation/bloc/tv_series_list/top_rated/tv_series_top_rated_state.dart';

import '../widgets/tv_series_card_list.dart';

class TvSeriesTopRatedPage extends StatefulWidget {
  const TvSeriesTopRatedPage({Key? key}) : super(key: key);

  @override
  State<TvSeriesTopRatedPage> createState() => _TvSeriesTopRatedPage();
}

class _TvSeriesTopRatedPage extends State<TvSeriesTopRatedPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvSeriesTopRatedBloc>().add(FetchTopRatedTvSeries());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Rated Tv Series"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: BlocBuilder<TvSeriesTopRatedBloc, TvSeriesTopRatedState>(
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
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.result[index];
                  return TvSeriesCardList(
                    key: const Key("items_list"),
                    data: tv,
                  );
                },
                itemCount: data.result.length,
              );
            } else if (data is TvSeriesTopRatedError) {
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
