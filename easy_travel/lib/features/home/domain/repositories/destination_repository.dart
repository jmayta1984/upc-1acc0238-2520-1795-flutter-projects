import 'package:easy_travel/features/home/domain/models/category.dart';
import 'package:easy_travel/features/home/domain/models/destination.dart';

abstract class DestinationRepository {
  Future<List<Destination>> getDestinations(CategoryType category);
}