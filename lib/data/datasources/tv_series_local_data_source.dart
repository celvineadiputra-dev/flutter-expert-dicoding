import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/models/tv_series_table.dart';

abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchList(TvSeriesTable tvSeriesTable);

  Future<String> removeWatchlist(TvSeriesTable movie);

  Future<TvSeriesTable?> getTvSeriesById(int id);

  Future<List<TvSeriesTable>> getWatchlistTvSeries();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  final DatabaseHelper databaseHelper;

  TvSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<TvSeriesTable?> getTvSeriesById(int id) {
    // TODO: implement getTvSeriesById
    throw UnimplementedError();
  }

  @override
  Future<List<TvSeriesTable>> getWatchlistTvSeries() {
    // TODO: implement getWatchlistTvSeries
    throw UnimplementedError();
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
  Future<String> removeWatchlist(TvSeriesTable movie) {
    // TODO: implement removeWatchlist
    throw UnimplementedError();
  }
}
