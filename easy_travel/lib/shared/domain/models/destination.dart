class Destination {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final bool isFavorite;

  const Destination({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    this.isFavorite = false,
  });

  Destination copyWith({bool? isFavorite}) {
    return Destination(
      id: id,
      title: title,
      posterPath: posterPath,
      overview: overview,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
