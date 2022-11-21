import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_bloc.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_event.dart';
import 'package:tvseries/presentation/bloc/watch_list/list/watch_list_state.dart';

import '../widgets/tv_series_card_list.dart';

class WatchListTvSeries extends StatefulWidget {

  const WatchListTvSeries({Key? key}) : super(key: key);

  @override
  State<WatchListTvSeries> createState() => _WatchListTvSeriesState();
}

class _WatchListTvSeriesState extends State<WatchListTvSeries> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WatchListTvSeriesBloc>().add(const FetchAllWatchList());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<WatchListTvSeriesBloc>().add(const FetchAllWatchList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WatchList Tv Series"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchListTvSeriesBloc, WatchListTvSeriesState>(
          builder: (context, data) {
            if (data is WatchListLoading) {
              if (data.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.Empty) {
                return const Center(
                  child: Text("Empty"),
                );
              }
            } else if (data is WatchListHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.result[index];
                  return TvSeriesCardList(
                    data: tv,
                  );
                },
                itemCount: data.result.length,
              );
            } else if (data is WatchListError) {
              return Center(
                key: const Key('error_message'),
                child: Text(data.message),
              );
            } else {
              return const Text('Failed');
            }
            return Expanded(child: Container());
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
