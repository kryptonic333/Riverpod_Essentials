class FavoriteItem {
  final String id;
  final String name;
  final bool isFavorite;

  FavoriteItem({
    required this.id,
    required this.name,
    required this.isFavorite ,
  });

  FavoriteItem copyWith({
    String? id,
    String? name,
    bool? isFavorite,
  }) {
    return FavoriteItem(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
