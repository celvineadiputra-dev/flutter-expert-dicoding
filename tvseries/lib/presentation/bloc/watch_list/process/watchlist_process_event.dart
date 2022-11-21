import 'package:equatable/equatable.dart';
import 'package:tvseries/domain/entities/tv_series_detail.dart';

abstract class WatchlistProcessEvent extends Equatable {
  const WatchlistProcessEvent();

  @override
  List<Object?> get props => [];
}

class FetchStatusWatchList extends WatchlistProcessEvent {
  final int id;

  const FetchStatusWatchList(this.id);

  @override
  List<Object?> get props => [id];
}

class AddToWatchList extends WatchlistProcessEvent {
  final TvSeriesDetail tvSeriesDetail;

  const AddToWatchList(this.tvSeriesDetail);

  @override
  List<Object?> get props => [tvSeriesDetail];
}

class RemoveFromWatchList extends WatchlistProcessEvent {
  final TvSeriesDetail tvSeriesDetail;

  const RemoveFromWatchList(this.tvSeriesDetail);

  @override
  List<Object?> get props => [tvSeriesDetail];
}
