import 'package:easy_travel/features/favorites/presentation/blocs/favorites_bloc.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_event.dart';
import 'package:easy_travel/shared/domain/models/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCard extends StatelessWidget {
  final Destination destination;
  const FavoriteCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipOval(
          child: Image.network(
            height: 40,
            width: 40,
            fit: BoxFit.cover,
            destination.posterPath),
        ),
        title: Text(destination.title),

        trailing: IconButton(
          onPressed: () => context.read<FavoritesBloc>().add(
            RemoveFavorite(destination: destination),
          ),
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
