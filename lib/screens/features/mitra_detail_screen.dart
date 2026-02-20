import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/mitra_location.dart';
import '../../widgets/custom_3d_button.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MitraDetailScreen extends StatelessWidget {
  final MitraLocation mitra;

  const MitraDetailScreen({super.key, required this.mitra});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryGreen),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          mitra.name,
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryGreen),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                mitra.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.store,
                    size: 80,
                    color: AppTheme.primaryGreen,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mitra Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          mitra.name,
                          style: AppTheme.heading2.copyWith(
                            color: AppTheme.textPrimaryColor,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 24),
                          const SizedBox(width: 4),
                          Text(
                            mitra.rating.toString(),
                            style: AppTheme.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Location & Contact
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppTheme.textSecondaryColor,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          mitra.address,
                          style: AppTheme.bodyMedium.copyWith(
                            color: AppTheme.textSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: AppTheme.textSecondaryColor,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        mitra.contactName,
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.textSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: AppTheme.textSecondaryColor,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        mitra.phone,
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.textSecondaryColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Commodities
                  Text(
                    'Komoditas Tersedia',
                    style: AppTheme.heading3.copyWith(
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: mitra.commodities
                        .map((c) => _buildCommodityChip(c))
                        .toList(),
                  ),

                  const SizedBox(height: 32),

                  // Mini Map
                  Text(
                    'Lokasi Peta',
                    style: AppTheme.heading3.copyWith(
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(mitra.latitude, mitra.longitude),
                        initialZoom: 15.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.digmarapps',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(mitra.latitude, mitra.longitude),
                              width: 40,
                              height: 40,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: Custom3DButton(
                          label: 'Hubungi MITRA',
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Custom3DButton(label: 'Kerjasama', onTap: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommodityChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryGreen.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppTheme.primaryGreen,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
