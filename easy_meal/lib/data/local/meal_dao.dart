import 'package:easy_meal/core/constants/database_constants.dart';
import 'package:easy_meal/core/database/app_database.dart';
import 'package:easy_meal/data/local/meal_entity.dart';

class MealDao {
  Future<void> insert(MealEntity entity) async {
    final db = await AppDatabase().database;
    await db.insert(DatabaseConstants.mealsTableName, entity.toMap());
  }

  Future<void> delete(String id) async {
    final db = await AppDatabase().database;
    await db.delete(
      DatabaseConstants.mealsTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Set<String>> fetchAllMealIds() async {
    final db = await AppDatabase().database;
    final maps = await db.query(DatabaseConstants.mealsTableName);
    return maps.map((map) => map['id'] as String).toSet();
  }
}
