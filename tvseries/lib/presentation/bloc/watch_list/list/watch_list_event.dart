import 'package:equatable/equatable.dart';

abstract class WatchListEvent extends Equatable {
  const WatchListEvent();

  @override
  List<Object?> get props => [];
}

class FetchAllWatchList extends WatchListEvent {
  const FetchAllWatchList();

  @override
  List<Object?> get props => [];
}