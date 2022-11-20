// import 'package:core/core.dart';
// import 'package:core/presentation/provider/watchlist_tv_series_notifier.dart';
// import 'package:core/presentation/widgets/tv_series_card_list.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class WatchListTvSeries extends StatefulWidget {
//   static const ROUTE_NAME = 'watchlist-tv-series';
//
//   const WatchListTvSeries({Key? key}) : super(key: key);
//
//   @override
//   State<WatchListTvSeries> createState() => _WatchListTvSeriesState();
// }
//
// class _WatchListTvSeriesState extends State<WatchListTvSeries> with RouteAware {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() =>
//         Provider.of<WatchlistTvSeriesNotifier>(context, listen: false)
//             .fetchWatchlistTvSeries());
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     routeObserver.subscribe(this, ModalRoute.of(context)!);
//   }
//
//   @override
//   void didPopNext() {
//     Provider.of<WatchlistTvSeriesNotifier>(context, listen: false)
//         .fetchWatchlistTvSeries();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("WatchList Tv Series"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Consumer<WatchlistTvSeriesNotifier>(
//           builder: (context, data, child) {
//             if (data.watchlistState == RequestState.Loading) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (data.watchlistState == RequestState.Loaded) {
//               return ListView.builder(
//                 itemBuilder: (context, index) {
//                   final tv = data.watchlist[index];
//                   return TvSeriesCardList(
//                     data: tv,
//                   );
//                 },
//                 itemCount: data.watchlist.length,
//               );
//             } else {
//               return Center(
//                 key: Key('error_message'),
//                 child: Text(data.message),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//     super.dispose();
//   }
// }
