import 'package:easy_travel/domain/models/category.dart';
import 'package:easy_travel/domain/models/destination.dart';

abstract class DestinationRepository {
  Future<List<Destination>> getDestinations(CategoryType category);
}