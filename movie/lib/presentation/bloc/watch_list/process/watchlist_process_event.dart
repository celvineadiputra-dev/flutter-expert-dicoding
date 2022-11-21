import 'package:equatable/equatable.dart';
import 'package:movie/domain/entities/movie_detail.dart';

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
  final MovieDetail movieDetail;

  const AddToWatchList(this.movieDetail);

  @override
  List<Object?> get props => [movieDetail];
}

class RemoveFromWatchList extends WatchlistProcessEvent {
  final MovieDetail movieDetail;

  const RemoveFromWatchList(this.movieDetail);

  @override
  List<Object?> get props => [movieDetail];
}
