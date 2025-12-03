import 'package:rick_morty/core/constants/database_constants.dart';
import 'package:rick_morty/core/database/app_database.dart';
import 'package:rick_morty/data/local/character_entity.dart';

class CharacterDao {
  Future<void> insert(CharacterEntity character) async {
    final db = await AppDatabase().database;
    await db.insert(DatabaseConstants.charactersTableName, character.toMap());
  }

  Future<void> delete(int id) async {
    final db = await AppDatabase().database;
    await db.delete(
      DatabaseConstants.charactersTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Set<int>> getFavoriteCharacterIds() async {
    final db = await AppDatabase().database;
    final List<Map<String, dynamic>> maps = await db.query(
      DatabaseConstants.charactersTableName,
    );

    return maps.map((map) => map['id'] as int).toSet();
  }
}
