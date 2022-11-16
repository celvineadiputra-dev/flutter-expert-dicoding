import 'package:core/core.dart';
import 'package:core/presentation/provider/tv_series_list_notifier.dart';
import 'package:core/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvSeriesOnAirPage extends StatefulWidget {
  static const ROUTE_NAME = "/tv-series-on-air";

  const TvSeriesOnAirPage({Key? key}) : super(key: key);

  @override
  State<TvSeriesOnAirPage> createState() => _TvSeriesOnAirPageState();
}

class _TvSeriesOnAirPageState extends State<TvSeriesOnAirPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvSeriesListNotifier>(context, listen: false)
            .fetchNowPlayingTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing Tv Series"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Consumer<TvSeriesListNotifier>(
          builder: (context, data, child) {
            if (data.nowPlayingState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.nowPlayingState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.nowPlayingTvSeries[index];
                  return TvSeriesCardList(
                    data: tv,
                  );
                },
                itemCount: data.nowPlayingTvSeries.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
