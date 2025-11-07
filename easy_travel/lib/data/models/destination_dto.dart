import 'package:easy_travel/domain/models/destination.dart';

class DestinationDto {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final double rating;
  final String city;
  final String country;
  final String type;
  final String bestSeason;
  final List<String> highlights;
  final double price;
  final int durationDays;
  final List<String> tags;

  const DestinationDto({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.rating,
    required this.city,
    required this.country,
    required this.type,
    required this.bestSeason,
    required this.highlights,
    required this.price,
    required this.durationDays,
    required this.tags,
  });

  factory DestinationDto.fromJson(Map<String, dynamic> json) {
    return DestinationDto(
      id: json['id'],
      title: json['title'],
      posterPath: json['posterPath'],
      overview: json['overview'],
      rating: (json['rating'] as num).toDouble(),
      city: json['city'],
      country: json['country'],
      type: json['type'],
      bestSeason: json['bestSeason'],
      highlights: List<String>.from(json['highlights']),
      price: (json['priceUSD'] as num).toDouble(),
      durationDays: json['durationDays'],
      tags: List<String>.from(json['tags']),
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
