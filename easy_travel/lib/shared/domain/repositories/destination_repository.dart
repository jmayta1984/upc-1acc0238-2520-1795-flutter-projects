import 'package:easy_travel/shared/domain/models/category.dart';
import 'package:easy_travel/shared/domain/models/destination.dart';

abstract class DestinationRepository {
  Future<List<Destination>> getDestinations(CategoryType category);
}