import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';
import '../../services/dummy_data_service.dart';
import '../../models/commodity.dart';
import '../../models/prediction_data.dart';
import 'dashboard_detail_screen.dart';

class FoodDashScreen extends StatefulWidget {
  const FoodDashScreen({super.key});

  @override
  State<FoodDashScreen> createState() => _FoodDashScreenState();
}

class _FoodDashScreenState extends State<FoodDashScreen> {
  final _searchController = TextEditingController();
  String _selectedCommodityId = DummyDataService.commodities.first.id;

  Commodity get _selectedCommodity => DummyDataService.commodities.firstWhere(
    (c) => c.id == _selectedCommodityId,
    orElse: () => DummyDataService.commodities.first,
  );

  DashboardData get _selectedDashboard =>
      DummyDataService.dashboards.firstWhere(
        (d) => d.commodityId == _selectedCommodityId,
        orElse: () => DummyDataService.dashboards.first,
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
                    'FOODASH',
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

                  // Commodity Image/Icon
                  _selectedCommodity.imagePath.isNotEmpty
                      ? Image.asset(
                          _selectedCommodity.imagePath,
                          height: 80,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              SizedBox(
                                height: 80,
                                child: Icon(
                                  _selectedCommodity.icon ??
                                      Icons.local_florist,
                                  size: 50,
                                  color: Colors.red,
                                ),
                              ),
                        )
                      : SizedBox(
                          height: 80,
                          child: Icon(
                            _selectedCommodity.icon ?? Icons.local_florist,
                            size: 50,
                            color: Colors.red,
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
                              _buildStatItem(
                                'Harga:',
                                'Rp ${_selectedCommodity.pricePerKg.toStringAsFixed(0)} / Kg',
                              ),
                              const SizedBox(height: 12),
                              _buildStatItem(
                                'Distribusi:',
                                '${_selectedDashboard.distributionLevel}/10',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildStatItem(
                                'Kebutuhan Mitra:',
                                '${_selectedDashboard.mitraNeedKg} Kg',
                              ),
                              const SizedBox(height: 12),
                              _buildStatItem(
                                'Kerawanan:',
                                _selectedDashboard.vulnerability,
                              ),
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
                          minY: _getMinY(),
                          maxY: _getMaxY(),
                          lineBarsData: [
                            LineChartBarData(
                              spots: _getSupplySpots(),
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashboardDetailScreen(
                                    dashboardData: _selectedDashboard,
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

  List<FlSpot> _getSupplySpots() {
    final supply = _selectedDashboard.weeklySupply;
    return List.generate(
      supply.length,
      (index) => FlSpot(index.toDouble(), supply[index]),
    );
  }

  double _getMinY() {
    final min = _selectedDashboard.weeklySupply.reduce((a, b) => a < b ? a : b);
    return min * 0.8;
  }

  double _getMaxY() {
    final max = _selectedDashboard.weeklySupply.reduce((a, b) => a > b ? a : b);
    return max * 1.2;
  }
}
