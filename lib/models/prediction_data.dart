class PredictionData {
  final String id;
  final String commodityId;
  final List<double> priceHistory; // 6 months past
  final List<double> pricePrediction; // 6 months future
  final String demandTrend; // 'Naik', 'Turun', 'Stabil'
  final String targetMarket;
  final double confidenceScore;
  final String recommendation;

  const PredictionData({
    required this.id,
    required this.commodityId,
    required this.priceHistory,
    required this.pricePrediction,
    required this.demandTrend,
    required this.targetMarket,
    required this.confidenceScore,
    required this.recommendation,
  });
}

class DashboardData {
  final String id;
  final String commodityId;
  final double distributionLevel; // 1-10
  final double mitraNeedKg;
  final String vulnerability; // 'Rendah', 'Sedang', 'Tinggi'
  final List<double> weeklySupply; // Past 7 weeks

  const DashboardData({
    required this.id,
    required this.commodityId,
    required this.distributionLevel,
    required this.mitraNeedKg,
    required this.vulnerability,
    required this.weeklySupply,
  });
}
