import 'package:rick_morty/domain/models/character.dart';

abstract class CharactersEvent {
  const CharactersEvent();
}

class SearchCharacters extends CharactersEvent {
  final String query;
  const SearchCharacters({required this.query});
}

class ToggelFavorite extends CharactersEvent {
  final Character character;
  const ToggelFavorite({required this.character});
}
