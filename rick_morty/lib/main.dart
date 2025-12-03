import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/data/local/character_dao.dart';
import 'package:rick_morty/data/remote/character_service.dart';
import 'package:rick_morty/data/repositories/character_repository_impl.dart';
import 'package:rick_morty/domain/repositories/character_repository.dart';
import 'package:rick_morty/presentation/blocs/characters_bloc.dart';
import 'package:rick_morty/presentation/pages/characters_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterRepository repository = CharacterRepositoryImpl(
      service: CharacterService(),
      dao: CharacterDao(),
    );
    return BlocProvider(
      create: (context) => CharactersBloc(repository: repository),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CharactersPage(),
      ),
    );
  }
}
