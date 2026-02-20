import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';
import '../../models/trace_record.dart';

class TraceDetailScreen extends StatelessWidget {
  final TraceRecord record;

  const TraceDetailScreen({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Detail Traceability',
          style: AppTheme.heading3.copyWith(color: AppTheme.textPrimaryColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.textPrimaryColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Info
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withValues(alpha: 0.05),
                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner,
                      size: 40,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    record.batchId,
                    style: AppTheme.heading2.copyWith(
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    record.commodityName,
                    style: AppTheme.bodyLarge.copyWith(
                      color: AppTheme.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status Tracker
                  Text(
                    'Riwayat Distribusi',
                    style: AppTheme.heading3.copyWith(
                      color: AppTheme.textPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTrackerStep(
                    title: 'Panen & Petani',
                    subtitle: '${record.farmerName} • ${record.farmLocation}',
                    date: record.harvestDate,
                    icon: Icons.agriculture,
                    isCompleted: true,
                    isLast: false,
                  ),
                  _buildTrackerStep(
                    title: 'Proses & Kualitas',
                    subtitle: 'Grade: ${record.qualityGrade}',
                    date: record.processingDate,
                    icon: Icons.verified_outlined,
                    isCompleted: true,
                    isLast: false,
                  ),
                  _buildTrackerStep(
                    title: 'Distribusi Terakhir',
                    subtitle: record.lastScanLocation,
                    date: 'Saat Ini',
                    icon: Icons.local_shipping_outlined,
                    isCompleted:
                        record.currentStatus.contains('Distribusi') ||
                        record.currentStatus.contains('Tiba'),
                    isLast: true,
                    isActive: true,
                  ),

                  const SizedBox(height: 32),

                  // Info Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informasi Produk',
                          style: AppTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimaryColor,
                          ),
                        ),
                        const Divider(height: 24),
                        _buildInfoRow('ID Batch', record.batchId),
                        const SizedBox(height: 12),
                        _buildInfoRow('Petani/Mitra', record.farmerName),
                        const SizedBox(height: 12),
                        _buildInfoRow('Lokasi Panen', record.farmLocation),
                        const SizedBox(height: 12),
                        _buildInfoRow('Kualitas', record.qualityGrade),
                        const SizedBox(height: 12),
                        _buildInfoRow('Status Saat Ini', record.currentStatus),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Action Buttons
                  SizedBox(
                    width: double.infinity,
                    child: Custom3DButton(
                      label: 'Unduh Sertifikat Kualitas',
                      icon: Icons.download_outlined,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackerStep({
    required String title,
    required String subtitle,
    required String date,
    required IconData icon,
    bool isCompleted = false,
    bool isLast = false,
    bool isActive = false,
  }) {
    Color color = isCompleted ? AppTheme.primaryGreen : Colors.grey.shade400;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isCompleted
                    ? color.withValues(alpha: 0.1)
                    : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCompleted ? color : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: Icon(
                icon,
                size: 20,
                color: isActive ? AppTheme.primaryGreen : color,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isCompleted ? color : Colors.grey.shade300,
                margin: const EdgeInsets.symmetric(vertical: 4),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isActive
                          ? AppTheme.primaryGreen
                          : AppTheme.textPrimaryColor,
                    ),
                  ),
                  Text(
                    date,
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textSecondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.textSecondaryColor,
                ),
              ),
              if (!isLast) const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.textSecondaryColor,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: AppTheme.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
