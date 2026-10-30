class Menu {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final bool isAvailable;

  const Menu({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.isAvailable,
  });
}
