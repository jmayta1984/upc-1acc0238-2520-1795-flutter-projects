import 'package:easy_travel/core/constants/database_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase _instance = AppDatabase._();

  factory AppDatabase() {
    return _instance;
  }

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }

  Future<Database> _initDatabase() async {
    final String path = join(
      await getDatabasesPath(),
      DatabaseConstants.databaseName,
    );

    return await openDatabase(
      path,
      version: DatabaseConstants.databaseVersion,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE ${DatabaseConstants.destinationsTable} ( 
      id INTEGER PRIMARY KEY,
      title TEXT, 
      poster_path TEXT, 
      overview TEXT)''');
      },
    );
  }
}
