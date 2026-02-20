import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';

class AgriPredicyScreen extends StatefulWidget {
  const AgriPredicyScreen({super.key});

  @override
  State<AgriPredicyScreen> createState() => _AgriPredicyScreenState();
}

class _AgriPredicyScreenState extends State<AgriPredicyScreen> {
  final _searchController = TextEditingController(
    text: 'Cari Komoditas untuk Prediksi',
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

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                          ),
                          suffixIcon: Icon(
                            Icons.close,
                            color: Colors.grey.shade400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Commodity Label
                  Text(
                    'Tomat Apel',
                    style: AppTheme.heading3.copyWith(
                      color: AppTheme.primaryGreen,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Tomat Apel Image
                  Image.asset(
                    'assets/images/assets-pageapps/Tomat apel.png',
                    height: 100,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      height: 100,
                      child: Icon(
                        Icons.local_florist,
                        size: 60,
                        color: Colors.red,
                      ),
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
                                  'Prediksi Komoditas',
                                  style: AppTheme.heading3.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Memproyeksikan kebutuhan dan ketersediaan pangan',
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
                                    'Jan',
                                    'Feb',
                                    'Mar',
                                    'Apr',
                                    'May',
                                    'Jun',
                                  ];
                                  if (value.toInt() < months.length) {
                                    return Text(
                                      months[value.toInt()],
                                      style: const TextStyle(fontSize: 10),
                                    );
                                  }
                                  return const Text('');
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          minX: 0,
                          maxX: 5,
                          minY: 0,
                          maxY: 6,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 1),
                                FlSpot(1, 2.5),
                                FlSpot(2, 2),
                                FlSpot(3, 4),
                                FlSpot(4, 3.5),
                                FlSpot(5, 5),
                              ],
                              isCurved: true,
                              color: Colors.blue.shade700,
                              barWidth: 2,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(show: false),
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
                            onTap: () {},
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
}
