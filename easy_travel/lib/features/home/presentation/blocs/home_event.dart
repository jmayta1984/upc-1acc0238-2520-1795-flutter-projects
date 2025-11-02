import 'package:easy_travel/features/home/domain/models/category.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class GetDestinationsByCategory extends HomeEvent {
  final CategoryType category;
  const GetDestinationsByCategory({required this.category});
}