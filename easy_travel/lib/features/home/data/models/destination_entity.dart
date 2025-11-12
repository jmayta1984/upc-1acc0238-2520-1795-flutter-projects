import 'package:easy_travel/shared/domain/models/destination.dart';

class DestinationEntity {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  const DestinationEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
    };
  }

  factory DestinationEntity.fromMap(Map<String, dynamic> map) {
    return DestinationEntity(
      id: map['id'],
      title: map['title'],
      posterPath: map['poster_path'],
      overview: map['overview'],
    );
  }

  factory DestinationEntity.fromDomain(Destination destination) {
    return DestinationEntity(
      id: destination.id,
      title: destination.title,
      posterPath: destination.posterPath,
      overview: destination.overview,
    );
  }

  Destination toDomain() {
    return Destination(
      id: id,
      title: title,
      posterPath: posterPath,
      overview: overview,
    );
  }
}
