import 'package:equatable/equatable.dart';

abstract class WatchListTvSeriesEvent extends Equatable {
  const WatchListTvSeriesEvent();

  @override
  List<Object?> get props => [];
}

class FetchAllWatchList extends WatchListTvSeriesEvent {
  const FetchAllWatchList();

  @override
  List<Object?> get props => [];
}