import 'package:core/core.dart';
import 'package:core/presentation/provider/tv_series_list_notifier.dart';
import 'package:core/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvSeriesTopRatedPage extends StatefulWidget {
  static const ROUTE_NAME = "/tv-series-top-rated";

  const TvSeriesTopRatedPage({Key? key}) : super(key: key);

  @override
  State<TvSeriesTopRatedPage> createState() => _TvSeriesTopRatedPage();
}

class _TvSeriesTopRatedPage extends State<TvSeriesTopRatedPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvSeriesListNotifier>(context, listen: false)
            .fetchTopRatedTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Rated Tv Series"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Consumer<TvSeriesListNotifier>(
          builder: (context, data, child) {
            if (data.topRatedState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.topRatedState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.topRatedTvSeries[index];
                  return TvSeriesCardList(
                    key: Key("items_list"),
                    data: tv,
                  );
                },
                itemCount: data.topRatedTvSeries.length,
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
