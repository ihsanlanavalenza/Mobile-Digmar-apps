import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';
import '../../services/dummy_data_service.dart';
import '../../models/mitra_location.dart';
import 'mitra_detail_screen.dart';

class AgriMapScreen extends StatefulWidget {
  const AgriMapScreen({super.key});

  @override
  State<AgriMapScreen> createState() => _AgriMapScreenState();
}

class _AgriMapScreenState extends State<AgriMapScreen> {
  final _searchController = TextEditingController();
  MitraLocation? _selectedMitra;

  @override
  void initState() {
    super.initState();
    if (DummyDataService.mitraLocations.isNotEmpty) {
      _selectedMitra = DummyDataService.mitraLocations.first;
      _searchController.text = _selectedMitra!.region;
    }
  }

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
                    'AGRIMAP ROOM',
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

                  // Map
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: _buildMap(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Info Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedMitra?.name ?? 'Pilih Mitra',
                            style: AppTheme.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _selectedMitra?.address ?? '-',
                            style: AppTheme.bodySmall.copyWith(
                              color: AppTheme.textSecondaryColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Potensi Supplier: ${_selectedMitra?.commodities.join(", ") ?? "-"}',
                            style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.primaryGreen,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Custom3DButton(
                                  label: 'Lihat Lokasi',
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Custom3DButton(
                                  label: 'Hubungi Mitra',
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Ringkasan Wilayah
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ringkasan Wilayah',
                          style: AppTheme.heading3.copyWith(
                            color: AppTheme.primaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Mitra MBG di Wilayah ini',
                                    style: AppTheme.bodySmall,
                                  ),
                                  Text(
                                    'Desa dengan mitra terbanyak',
                                    style: AppTheme.bodySmall,
                                  ),
                                  Text(
                                    'Potensi Pasar Utama',
                                    style: AppTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '12',
                                    style: AppTheme.bodySmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Desa Sumedang',
                                    style: AppTheme.bodySmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Beras',
                                    style: AppTheme.bodySmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

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
                            label: 'Lihat Marketplace',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Informasi Mitra Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      width: double.infinity,
                      child: Custom3DButton(
                        label: 'Informasi Mitra',
                        onTap: () {
                          if (_selectedMitra != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MitraDetailScreen(mitra: _selectedMitra!),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Pilih Mitra Terlebih Dahulu'),
                              ),
                            );
                          }
                        },
                        width: double.infinity,
                      ),
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

  Widget _buildMap() {
    final center = _selectedMitra != null
        ? LatLng(_selectedMitra!.latitude, _selectedMitra!.longitude)
        : const LatLng(-6.8384, 107.9253);

    return FlutterMap(
      options: MapOptions(initialCenter: center, initialZoom: 8.0),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.digmarapps',
        ),
        MarkerLayer(
          markers: DummyDataService.mitraLocations.map((mitra) {
            final isSelected = _selectedMitra?.id == mitra.id;
            return Marker(
              point: LatLng(mitra.latitude, mitra.longitude),
              width: 100,
              height: 60,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedMitra = mitra;
                    _searchController.text = mitra.region;
                  });
                },
                child: _buildMarker(mitra.name, isSelected),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildMarker(String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryGreen : Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 2,
              ),
            ],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Icon(
          Icons.location_on,
          color: isSelected ? Colors.red : AppTheme.primaryGreen,
          size: isSelected ? 32 : 24,
        ),
      ],
    );
  }
}
