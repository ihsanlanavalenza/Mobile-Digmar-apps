import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';

class FoodDashScreen extends StatefulWidget {
  const FoodDashScreen({super.key});

  @override
  State<FoodDashScreen> createState() => _FoodDashScreenState();
}

class _FoodDashScreenState extends State<FoodDashScreen> {
  final _searchController = TextEditingController(text: 'Cari Komoditas');

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
                    'FOODASH',
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

                  // Tomato Image
                  Image.asset(
                    'assets/images/assets-pageapps/Tomat apel.png',
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      height: 80,
                      child: Icon(
                        Icons.local_florist,
                        size: 50,
                        color: Colors.red,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Dashboard Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      width: double.infinity,
                      child: Custom3DButton(
                        label: 'DASHBOARD INFORMASI',
                        onTap: () {},
                        width: double.infinity,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Stats Grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildStatItem('Harga:', 'Rp 45.000 / Kg'),
                              const SizedBox(height: 12),
                              _buildStatItem('Distribusi:', 'Tinggi'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildStatItem('Kebutuhan Mitra:', '1200 Kg'),
                              const SizedBox(height: 12),
                              _buildStatItem('Kerawanan:', 'Rendah'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Chart
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 160,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          minX: 0,
                          maxX: 6,
                          minY: 0,
                          maxY: 6,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 1.5),
                                FlSpot(1, 2),
                                FlSpot(2, 2.5),
                                FlSpot(3, 3.5),
                                FlSpot(4, 4),
                                FlSpot(5, 4.5),
                                FlSpot(6, 5.5),
                              ],
                              isCurved: true,
                              color: AppTheme.primaryGreen,
                              barWidth: 3,
                              dotData: FlDotData(
                                show: true,
                                getDotPainter: (spot, percent, barData, index) {
                                  return FlDotCirclePainter(
                                    radius: 6,
                                    color: Colors.white,
                                    strokeWidth: 3,
                                    strokeColor: AppTheme.primaryGreen,
                                  );
                                },
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                color: AppTheme.primaryGreen.withValues(
                                  alpha: 0.1,
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
                            label: 'Lihat Kebutuhan',
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

  Widget _buildStatItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.bodySmall.copyWith(
            color: AppTheme.textSecondaryColor,
          ),
        ),
        Text(
          value,
          style: AppTheme.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}
