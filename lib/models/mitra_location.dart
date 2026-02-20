class MitraLocation {
  final String id;
  final String name;
  final String address;
  final String region;
  final double latitude;
  final double longitude;
  final List<String> commodities;
  final String contactName;
  final String phone;
  final String imagePath;
  final double rating;

  const MitraLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.region,
    required this.latitude,
    required this.longitude,
    required this.commodities,
    required this.contactName,
    required this.phone,
    required this.imagePath,
    required this.rating,
  });
}
