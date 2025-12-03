import 'package:rick_morty/domain/models/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> searchCharacters(String query);
  Future<void> toggleFavorite(Character character);
}
