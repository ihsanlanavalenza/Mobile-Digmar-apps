import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';
import '../../services/dummy_data_service.dart';
import '../../models/commodity.dart';
import '../../models/prediction_data.dart';
import 'prediction_detail_screen.dart';

class AgriPredicyScreen extends StatefulWidget {
  const AgriPredicyScreen({super.key});

  @override
  State<AgriPredicyScreen> createState() => _AgriPredicyScreenState();
}

class _AgriPredicyScreenState extends State<AgriPredicyScreen> {
  final _searchController = TextEditingController();
  String _selectedCommodityId = DummyDataService.commodities.first.id;

  Commodity get _selectedCommodity => DummyDataService.commodities.firstWhere(
    (c) => c.id == _selectedCommodityId,
    orElse: () => DummyDataService.commodities.first,
  );

  PredictionData get _selectedPrediction =>
      DummyDataService.predictions.firstWhere(
        (p) => p.commodityId == _selectedCommodityId,
        orElse: () => DummyDataService.predictions.first,
      );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Image
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/Header Aplikasi.png',
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) =>
                  Container(height: 120, color: AppTheme.primaryGreen),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  // Title
                  Text(
                    'AGRIPEDICY',
                    style: AppTheme.heading2.copyWith(
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Pilih Komoditas:',
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedCommodityId,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppTheme.primaryGreen,
                        ),
                        items: DummyDataService.commodities.map((c) {
                          return DropdownMenuItem<String>(
                            value: c.id,
                            child: Text(
                              c.name,
                              style: AppTheme.bodyLarge.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedCommodityId = newValue;
                              _searchController.text = _selectedCommodity.name;
                            });
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Commodity Label
                  Text(
                    _selectedCommodity.name,
                    style: AppTheme.heading3.copyWith(
                      color: AppTheme.primaryGreen,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Commodity Image/Icon
                  _selectedCommodity.imagePath.isNotEmpty
                      ? Image.asset(
                          _selectedCommodity.imagePath,
                          height: 100,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              SizedBox(
                                height: 100,
                                child: Icon(
                                  _selectedCommodity.icon ??
                                      Icons.local_florist,
                                  size: 60,
                                  color: Colors.red,
                                ),
                              ),
                        )
                      : SizedBox(
                          height: 100,
                          child: Icon(
                            _selectedCommodity.icon ?? Icons.local_florist,
                            size: 60,
                            color: Colors.red,
                          ),
                        ),

                  const SizedBox(height: 16),

                  // Prediction Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.primaryGreen, AppTheme.lightGreen],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: Colors.white,
                            size: 40,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Prediksi Harga ${_selectedCommodity.name}',
                                  style: AppTheme.heading3.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Proyeksi pergerakan harga komoditas dalam 6 bulan ke depan',
                                  style: AppTheme.bodySmall.copyWith(
                                    color: Colors.white.withValues(alpha: 0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Chart
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 180,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: true,
                            horizontalInterval: 1,
                            verticalInterval: 1,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.grey.shade200,
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: Colors.grey.shade200,
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 22,
                                interval: 1,
                                getTitlesWidget: (value, meta) {
                                  const months = [
                                    'B1',
                                    'B2',
                                    'B3',
                                    'B4',
                                    'B5',
                                    'B6',
                                    'B7',
                                    'B8',
                                    'B9',
                                    'B10',
                                    'B11',
                                    'B12',
                                  ];
                                  if (value.toInt() >= 0 &&
                                      value.toInt() < months.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        months[value.toInt()],
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    );
                                  }
                                  return const Text('');
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 35,
                                getTitlesWidget: (value, meta) {
                                  // Show thousands in K
                                  if (value % 5000 == 0) {
                                    return Text(
                                      '${(value / 1000).toInt()}k',
                                      style: const TextStyle(fontSize: 10),
                                    );
                                  }
                                  return const Text('');
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          minX: 0,
                          maxX: 11,
                          minY: _getMinY(),
                          maxY: _getMaxY(),
                          lineBarsData: [
                            // Past data line
                            LineChartBarData(
                              spots: _getHistorySpots(),
                              isCurved: true,
                              color: Colors.blue.shade700,
                              barWidth: 2,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(show: false),
                            ),
                            // Prediction data line
                            LineChartBarData(
                              spots: _getPredictionSpots(),
                              isCurved: true,
                              color: AppTheme.primaryGreen,
                              barWidth: 2,
                              dashArray: [5, 5],
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(
                                show: true,
                                color: AppTheme.primaryGreen.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Navigation Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Custom3DButton(
                            label: 'Kembali Keberanda',
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Custom3DButton(
                            label: 'Lihat Prediksi',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PredictionDetailScreen(
                                    prediction: _selectedPrediction,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Footer Image
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/Buttom page.png',
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) => SizedBox(
                height: 100,
                child: ColoredBox(
                  color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _getHistorySpots() {
    final history = _selectedPrediction.priceHistory;
    return List.generate(
      history.length,
      (index) => FlSpot(index.toDouble(), history[index]),
    );
  }

  List<FlSpot> _getPredictionSpots() {
    final prediction = _selectedPrediction.pricePrediction;
    final history = _selectedPrediction.priceHistory;
    // Link the last history point to the first prediction point
    List<FlSpot> spots = [
      FlSpot((history.length - 1).toDouble(), history.last),
    ];
    spots.addAll(
      List.generate(
        prediction.length,
        (index) =>
            FlSpot((history.length + index).toDouble(), prediction[index]),
      ),
    );
    return spots;
  }

  double _getMinY() {
    final allPrices = [
      ..._selectedPrediction.priceHistory,
      ..._selectedPrediction.pricePrediction,
    ];
    double min = allPrices.reduce((a, b) => a < b ? a : b);
    return min * 0.8; // Give some bottom padding
  }

  double _getMaxY() {
    final allPrices = [
      ..._selectedPrediction.priceHistory,
      ..._selectedPrediction.pricePrediction,
    ];
    double max = allPrices.reduce((a, b) => a > b ? a : b);
    return max * 1.2; // Give some top padding
  }
}
