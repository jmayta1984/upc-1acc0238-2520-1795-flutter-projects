import 'package:flutter/widgets.dart';
import 'package:rick_morty/domain/models/character.dart';
import 'package:rick_morty/presentation/widgets/character_card.dart';

class CharactersList extends StatelessWidget {
  final List<Character> characters;
  const CharactersList({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CharacterCard(character: character),
        );
      },
    );
  }
}
