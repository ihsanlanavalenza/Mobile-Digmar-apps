class TraceRecord {
  final String id;
  final String batchId;
  final String commodityName;
  final String farmerName;
  final String harvestDate;
  final String farmLocation;
  final String processingDate;
  final String qualityGrade;
  final String currentStatus;
  final String lastScanLocation;

  const TraceRecord({
    required this.id,
    required this.batchId,
    required this.commodityName,
    required this.farmerName,
    required this.harvestDate,
    required this.farmLocation,
    required this.processingDate,
    required this.qualityGrade,
    required this.currentStatus,
    required this.lastScanLocation,
  });
}
