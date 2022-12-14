import 'package:equatable/equatable.dart';
import 'package:tvseries/data/models/tv_series_model.dart';

class TvSeriesResponse extends Equatable {
  final List<TvSeriesModel> tvSeriesList;

  TvSeriesResponse({required this.tvSeriesList});

  factory TvSeriesResponse.fromJson(Map<String, dynamic> json) =>
      TvSeriesResponse(
        tvSeriesList: List<TvSeriesModel>.from(
          (json["results"] as List)
              .map(
                (e) => TvSeriesModel.fromJson(e),
              )
              .where((element) => element.posterPath != null),
        ),
      );

  Map<String, dynamic> toJson() =>
      {"results": List<dynamic>.from(tvSeriesList.map((e) => e.toJson()))};

  @override
  List<Object?> get props => [tvSeriesList];
}
