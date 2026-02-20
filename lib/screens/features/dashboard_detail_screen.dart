import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';
import '../../models/prediction_data.dart';

class DashboardDetailScreen extends StatelessWidget {
  final DashboardData dashboardData;

  const DashboardDetailScreen({super.key, required this.dashboardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Detail Kebutuhan Mitra',
          style: AppTheme.heading3.copyWith(color: AppTheme.textPrimaryColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.textPrimaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: dashboardData.vulnerability == 'Tinggi'
                    ? Colors.red.shade50
                    : dashboardData.vulnerability == 'Sedang'
                    ? Colors.orange.shade50
                    : AppTheme.lightGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: dashboardData.vulnerability == 'Tinggi'
                      ? Colors.red.shade200
                      : dashboardData.vulnerability == 'Sedang'
                      ? Colors.orange.shade200
                      : AppTheme.primaryGreen.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status Kerawanan Pasokan:',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        dashboardData.vulnerability == 'Tinggi'
                            ? Icons.warning_amber_rounded
                            : dashboardData.vulnerability == 'Sedang'
                            ? Icons.info_outline
                            : Icons.check_circle_outline,
                        color: dashboardData.vulnerability == 'Tinggi'
                            ? Colors.red.shade700
                            : dashboardData.vulnerability == 'Sedang'
                            ? Colors.orange.shade700
                            : AppTheme.primaryGreen,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          dashboardData.vulnerability,
                          style: AppTheme.heading2.copyWith(
                            color: dashboardData.vulnerability == 'Tinggi'
                                ? Colors.red.shade700
                                : dashboardData.vulnerability == 'Sedang'
                                ? Colors.orange.shade700
                                : AppTheme.primaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Logistics info
            Text(
              'Detail Logistik & Distribusi',
              style: AppTheme.heading3.copyWith(
                color: AppTheme.textPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            _buildDetailRow(
              'Kebutuhan Mitra Saat Ini',
              '${dashboardData.mitraNeedKg} Kg',
              Icons.shopping_cart_checkout,
            ),
            const SizedBox(height: 12),
            _buildDetailRow(
              'Skor Kelancaran Distribusi',
              '${dashboardData.distributionLevel} / 10',
              Icons.local_shipping_outlined,
            ),
            const SizedBox(height: 12),
            _buildDetailRow(
              'Rata-rata Pasokan Mingguan',
              '${_getAverageSupply().toStringAsFixed(1)} Ton',
              Icons.scale_outlined,
            ),

            const SizedBox(height: 32),

            // Action Button
            Custom3DButton(
              label: 'Penuhi Kebutuhan',
              onTap: () {},
              width: double.infinity,
            ),
            const SizedBox(height: 12),
            Custom3DButton(
              label: 'Kembali',
              onTap: () => Navigator.pop(context),
              width: double.infinity,
              gradientColors: [Colors.grey.shade400, Colors.grey.shade600],
            ),
          ],
        ),
      ),
    );
  }

  double _getAverageSupply() {
    double total = 0;
    for (var s in dashboardData.weeklySupply) {
      total += s;
    }
    return total / dashboardData.weeklySupply.length;
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.blue.shade700),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppTheme.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
