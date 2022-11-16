import 'package:core/core.dart';
import 'package:core/presentation/provider/tv_series_list_notifier.dart';
import 'package:core/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvSeriesPopularPage extends StatefulWidget {
  static const ROUTE_NAME = "/tv-series-popular";

  const TvSeriesPopularPage({Key? key}) : super(key: key);

  @override
  State<TvSeriesPopularPage> createState() => _TvSeriesPopularPage();
}

class _TvSeriesPopularPage extends State<TvSeriesPopularPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvSeriesListNotifier>(context, listen: false)
            .fetchPopularTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Tv Series"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Consumer<TvSeriesListNotifier>(
          builder: (context, data, child) {
            if (data.popularState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.popularState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.popularTvSeries[index];
                  return TvSeriesCardList(
                    data: tv,
                  );
                },
                itemCount: data.popularTvSeries.length,
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
