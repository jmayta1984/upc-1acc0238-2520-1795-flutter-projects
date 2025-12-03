import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/core/enums/status.dart';
import 'package:rick_morty/domain/models/character.dart';
import 'package:rick_morty/domain/repositories/character_repository.dart';
import 'package:rick_morty/presentation/blocs/characters_event.dart';
import 'package:rick_morty/presentation/blocs/characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository repository;

  CharactersBloc({required this.repository}) : super(const CharactersState()) {
    on<SearchCharacters>(_searchCharacters);
    on<ToggelFavorite>(_toggleFavorite);
  }

  FutureOr<void> _searchCharacters(
    SearchCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      List<Character> characters = await repository.searchCharacters(
        event.query,
      );
      emit(state.copyWith(status: Status.success, characters: characters));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: '$e'));
    }
  }

  FutureOr<void> _toggleFavorite(
    ToggelFavorite event,
    Emitter<CharactersState> emit,
  ) async {
    await repository.toggleFavorite(event.character);

    final List<Character> updateCharacters = state.characters.map((character) {
      return character.id == event.character.id
          ? character.copyWith(isFavorite: !character.isFavorite)
          : character;
    }).toList();

    emit(state.copyWith(characters: updateCharacters));
  }
}
