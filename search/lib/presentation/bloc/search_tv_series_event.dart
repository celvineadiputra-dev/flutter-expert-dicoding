import 'package:equatable/equatable.dart';

abstract class SearchTvSeriesEvent extends Equatable {
  const SearchTvSeriesEvent();

  @override
  List<Object?> get props => [];
}

class QuerySearchTvSeries extends SearchTvSeriesEvent {
  final String query;

  const QuerySearchTvSeries(this.query);

  @override
  List<Object?> get props => [];
}