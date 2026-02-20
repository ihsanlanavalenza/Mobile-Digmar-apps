class MarketProduct {
  final String id;
  final String name;
  final String commodityId;
  final String mitraId;
  final double price;
  final String unit;
  final int stock;
  final String description;
  final String imagePath;
  final double rating;
  final int reviews;

  const MarketProduct({
    required this.id,
    required this.name,
    required this.commodityId,
    required this.mitraId,
    required this.price,
    required this.unit,
    required this.stock,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.reviews,
  });
}
