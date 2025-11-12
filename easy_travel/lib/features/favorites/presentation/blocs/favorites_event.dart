import 'package:easy_travel/shared/domain/models/destination.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class GetAllFavorites extends FavoritesEvent {
  const GetAllFavorites();
}

class RemoveFavorite extends FavoritesEvent {
  final Destination destination;
  const RemoveFavorite({required this.destination});
}