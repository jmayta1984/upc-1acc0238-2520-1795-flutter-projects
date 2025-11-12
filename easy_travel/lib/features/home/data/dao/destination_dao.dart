import 'package:easy_travel/core/database/app_database.dart';
import 'package:easy_travel/features/home/data/models/destination_entity.dart';
import 'package:sqflite/sqflite.dart';

class DestinationDao {
  Future<void> insertDestination(DestinationEntity entity) async {
    Database db = await AppDatabase().database;
    await db.insert('destinations', entity.toMap());
  }

  Future<void> deleteDestination(int id) async {
    Database db = await AppDatabase().database;
    await db.delete('destinations', where: 'id = ?', whereArgs: [id]);
  }
}
