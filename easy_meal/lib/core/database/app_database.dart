import 'package:easy_meal/core/constants/database_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final _instance = AppDatabase._();

  AppDatabase._();

  factory AppDatabase() {
    return _instance;
  }

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), DatabaseConstants.databaseName);
    return openDatabase(
      path,
      version: DatabaseConstants.version,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE ${DatabaseConstants.mealsTableName} (
          id TEXT PRIMARY KEY,
          name TEXT,
          poster_path TEXT
        )
      ''');
      },
    );
  }
}
