import 'package:easy_travel/core/constants/database_constants.dart';
import 'package:easy_travel/core/database/app_database.dart';
import 'package:easy_travel/core/typedefs/typedefs.dart';
import 'package:easy_travel/features/home/data/models/destination_entity.dart';
import 'package:sqflite/sqflite.dart';

class DestinationDao {
  Future<void> insert(DestinationEntity entity) async {
    Database db = await AppDatabase().database;
    await db.insert(DatabaseConstants.destinationsTable, entity.toMap());
  }

  Future<void> delete(int id) async {
    Database db = await AppDatabase().database;
    await db.delete(
      DatabaseConstants.destinationsTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<DestinationEntity>> fetchAll() async {
    Database db = await AppDatabase().database;
    final Maps maps = await db.query(DatabaseConstants.destinationsTable);
    return maps.map((map) => DestinationEntity.fromMap(map)).toList();
  }

  Future<bool> isFavorite(int id) async {
    Database db = await AppDatabase().database;
    final Maps maps = await db.query(
      DatabaseConstants.destinationsTable,
      where: "id = ?",
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }
}
