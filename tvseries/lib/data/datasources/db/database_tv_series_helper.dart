import 'dart:async';
import 'package:sqflite/sqflite.dart';

import '../../models/tv_series_table.dart';

class DatabaseTvSeriesHelper {
  static DatabaseTvSeriesHelper? _databaseHelper;

  DatabaseTvSeriesHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseTvSeriesHelper() => _databaseHelper ?? DatabaseTvSeriesHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblWatchListTvSeries = 'watchlist_tv_series';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton_tv.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_tblWatchListTvSeries(
      id INTEGER PRIMARY KEY,
      name TEXT,
      overview TEXT,
      posterPath TEXT
    );
    ''');
  }

  Future<int> insertTvSeriesWatchList(TvSeriesTable tvSeries) async {
    final db = await database;
    return await db!.insert(_tblWatchListTvSeries, tvSeries.toJson());
  }

  Future<Map<String, dynamic>?> getTvSeriesById(int id) async {
    final db = await database;

    final results = await db!
        .query(_tblWatchListTvSeries, where: 'id = ?', whereArgs: [id]);

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<int> removeTvSeriesWatchList(TvSeriesTable tvSeriesTable) async {
    final db = await database;

    return await db!.delete(_tblWatchListTvSeries,
        where: 'id = ?', whereArgs: [tvSeriesTable.id]);
  }

  Future<List<Map<String, dynamic>>> getAllTvSeriesWatchList() async {
    final db = await database;

    final List<Map<String, dynamic>> results =
        await db!.query(_tblWatchListTvSeries);

    return results;
  }
}
