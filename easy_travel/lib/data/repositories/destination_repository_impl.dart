import 'package:easy_travel/data/models/destination_dto.dart';
import 'package:easy_travel/data/services/destination_service.dart';
import 'package:easy_travel/domain/models/category.dart';
import 'package:easy_travel/domain/models/destination.dart';
import 'package:easy_travel/domain/repositories/destination_repository.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationService service;

  const DestinationRepositoryImpl({required this.service});

  @override
  Future<List<Destination>> getDestinations(CategoryType category) async {
    final List<DestinationDto> dtos = await service.getDestinations(category);
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
