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
}
