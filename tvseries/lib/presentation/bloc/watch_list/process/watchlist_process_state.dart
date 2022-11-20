import 'package:core/utils/state_enum.dart';
import 'package:equatable/equatable.dart';
abstract class WatchlistProcessState extends Equatable {
  const WatchlistProcessState();

  @override
  List<Object?> get props => [];
}

class WatchlistProcessLoading extends WatchlistProcessState {
  final RequestState state;

  const WatchlistProcessLoading({this.state = RequestState.Empty});

  @override
  List<Object?> get props => [state];
}

class WatchlistProcessError extends WatchlistProcessState {
  final String message;

  const WatchlistProcessError({required this.message});

  @override
  List<Object?> get props => [message];
}

class WatchlistProcessIsAdded extends WatchlistProcessState {
  final bool result;

  const WatchlistProcessIsAdded(this.result);

  @override
  List<Object?> get props => [result];
}

class WatchlistProcessMessage extends WatchlistProcessState {
  final String message;

  const WatchlistProcessMessage(this.message);

  @override
  List<Object?> get props => [message];
}
