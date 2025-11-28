class Meal {
  final String id;
  final String name;
  final String posterPath;
  final bool isFavorite;

  const Meal({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.isFavorite,
  });

  Meal copyWith({bool? isFavorite}) {
    return Meal(
      id: id,
      name: name,
      posterPath: posterPath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
