import 'package:easy_travel/core/typedefs/typedefs.dart';
import 'package:easy_travel/features/home/data/dao/destination_dao.dart';
import 'package:easy_travel/features/home/data/models/destination_dto.dart';
import 'package:easy_travel/features/home/data/models/destination_entity.dart';
import 'package:easy_travel/features/home/data/services/destination_service.dart';
import 'package:easy_travel/shared/domain/models/category.dart';
import 'package:easy_travel/shared/domain/models/destination.dart';
import 'package:easy_travel/shared/domain/repositories/destination_repository.dart';
import 'package:flutter/foundation.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationService service;
  final DestinationDao dao;

  final ValueNotifier<Destinations> _destinations = ValueNotifier<Destinations>(
    [],
  );
  ValueListenable<Destinations> get destinationsListenable => _destinations;

  Destinations snapshot() => _destinations.value;

  DestinationRepositoryImpl({required this.service, required this.dao});

  @override
  Future<Destinations> getDestinations(CategoryType category) async {
    final List<DestinationDto> dtos = await service.getDestinations(category);

    final List<DestinationEntity> favorites = await dao.fetchAll();
    final List<int> favoriteIds = favorites.map((e) => e.id).toList();

    _destinations.value = dtos.map((dto) {
      final isFavorite = favoriteIds.contains(dto.id);
      return dto.toDomain().copyWith(isFavorite: isFavorite);
    }).toList();
    return _destinations.value;
  }

  @override
  Future<void> toggleFavorite(Destination destination) async {
    final isFavorite = destination.isFavorite;
    if (isFavorite) {
      await dao.delete(destination.id);
      _destinations.value = _destinations.value
          .where((d) => d.id != destination.id)
          .toList();
    } else {
      await dao.insert(DestinationEntity.fromDomain(destination));
      _destinations.value = [
        ..._destinations.value,
        destination.copyWith(isFavorite: true),
      ];
    }
  }

  @override
  Future<Destinations> getFavoriteDestinations() async {
    List<DestinationEntity> entities = await dao.fetchAll();
    return entities
        .map((entity) => entity.toDomain().copyWith(isFavorite: true))
        .toList();
  }
}
