class DeliveryRoute {
  final String id;
  final String truckId;
  final String driverName;
  final String origin;
  final String destination;
  final String status; // 'Persiapan', 'Dalam Perjalanan', 'Terkirim'
  final String estimatedArrival;
  final double progress; // 0.0 to 1.0
  final int totalStops;
  final int completedStops;
  final String currentLocation;

  const DeliveryRoute({
    required this.id,
    required this.truckId,
    required this.driverName,
    required this.origin,
    required this.destination,
    required this.status,
    required this.estimatedArrival,
    required this.progress,
    required this.totalStops,
    required this.completedStops,
    required this.currentLocation,
  });
}
