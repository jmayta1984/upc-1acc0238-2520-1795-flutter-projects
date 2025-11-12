import 'package:easy_travel/core/typedefs/typedefs.dart';
import 'package:easy_travel/shared/domain/models/category.dart';
import 'package:easy_travel/shared/domain/models/destination.dart';

abstract class DestinationRepository {
  Future<Destinations> getDestinations(CategoryType category);

  Future<void> toggleFavorite(Destination destination);

  Future<Destinations> getFavoriteDestinations();
}
