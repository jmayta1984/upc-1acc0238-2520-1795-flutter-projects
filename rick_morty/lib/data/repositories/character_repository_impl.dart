import 'package:rick_morty/data/local/character_dao.dart';
import 'package:rick_morty/data/local/character_entity.dart';
import 'package:rick_morty/data/remote/character_dto.dart';
import 'package:rick_morty/data/remote/character_service.dart';
import 'package:rick_morty/domain/models/character.dart';
import 'package:rick_morty/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterService service;
  final CharacterDao dao;

  const CharacterRepositoryImpl({required this.service, required this.dao});

  @override
  Future<List<Character>> searchCharacters(String query) async {
    try {
      List<CharacterDto> dtos = await service.searchCharacters(query);
      final favoriteIds = await dao.getFavoriteCharacterIds();

      return dtos
          .map(
            (dto) => dto.toDomain().copyWith(
              isFavorite: favoriteIds.contains(dto.id),
            ),
          )
          .toList();
    } catch (e) {
      return Future.error('$e');
    }
  }

  @override
  Future<void> toggleFavorite(Character character) async {
    character.isFavorite
        ? dao.delete(character.id)
        : dao.insert(CharacterEntity.fromDomain(character));
  }
}
