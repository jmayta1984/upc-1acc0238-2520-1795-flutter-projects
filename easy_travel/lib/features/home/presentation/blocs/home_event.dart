import 'package:easy_travel/shared/domain/models/category.dart';
import 'package:easy_travel/shared/domain/models/destination.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class GetDestinationsByCategory extends HomeEvent {
  final CategoryType category;
  const GetDestinationsByCategory({required this.category});
}

class ToggleFavorite extends HomeEvent {
  final Destination destination;
  const ToggleFavorite({required this.destination});
}
