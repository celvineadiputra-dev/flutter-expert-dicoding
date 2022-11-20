import 'package:core/core.dart';

import '../models/tv_series_table.dart';
import 'db/database_tv_series_helper.dart';

abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchList(TvSeriesTable tvSeriesTable);

  Future<String> removeWatchlist(TvSeriesTable tvSeriesTable);

  Future<TvSeriesTable?> getTvSeriesById(int id);

  Future<List<TvSeriesTable>> getAllWatchList();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  final DatabaseTvSeriesHelper databaseHelper;

  TvSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<TvSeriesTable?> getTvSeriesById(int id) async {
    final result = await databaseHelper.getTvSeriesById(id);

    if (result != null) {
      return TvSeriesTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<String> insertWatchList(TvSeriesTable tvSeriesTable) async {
    try {
      await databaseHelper.insertTvSeriesWatchList(tvSeriesTable);
      return 'Success added to watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(TvSeriesTable tvSeriesTable) async {
    try {
      await databaseHelper.removeTvSeriesWatchList(tvSeriesTable);

      return "Removed from watchlist";
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  Future<List<TvSeriesTable>> getAllWatchList() async {
    final result = await databaseHelper.getAllTvSeriesWatchList();

    return result.map((data) => TvSeriesTable.fromMap(data)).toList();
  }
}
