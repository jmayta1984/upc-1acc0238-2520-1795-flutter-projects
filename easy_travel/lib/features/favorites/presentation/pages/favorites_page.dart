import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_bloc.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_state.dart';
import 'package:easy_travel/features/favorites/presentation/widgets/favorite_card.dart';
import 'package:easy_travel/shared/domain/models/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            return const Center(child: CircularProgressIndicator());

          case Status.success:
            return ListView.builder(
              itemCount: state.destinations.length,
              itemBuilder: (context, index) {
                final Destination destination = state.destinations[index];
                return FavoriteCard(destination: destination);
              },
            );

          case Status.failure:
            return Center(child: Text(state.message ?? 'Unknown error'));

          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
