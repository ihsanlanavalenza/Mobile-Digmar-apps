import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';

class RouteSmartScreen extends StatefulWidget {
  const RouteSmartScreen({super.key});

  @override
  State<RouteSmartScreen> createState() => _RouteSmartScreenState();
}

class _RouteSmartScreenState extends State<RouteSmartScreen> {
  final _searchController = TextEditingController(text: 'SD Negeri 1 Cendana');

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
                    'ROUTE SMART',
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

                  const SizedBox(height: 20),

                  // Truck Illustration
                  Image.asset(
                    'assets/images/assets-pageapps/ROUTE SMART.png',
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      height: 120,
                      child: Icon(
                        Icons.local_shipping,
                        size: 80,
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Action Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _buildActionButton('Lihat Jadwal Hari ini'),
                        const SizedBox(height: 12),
                        _buildActionButton('Rute Jarak'),
                        const SizedBox(height: 12),
                        _buildActionButton('Atur Rute Pengiriman'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Resume Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Resume',
                          style: AppTheme.heading3.copyWith(
                            color: AppTheme.textPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildResumeItem(
                              Icons.calendar_today,
                              'Jadwal Pengiriman',
                              'Pukul 09.00',
                            ),
                            _buildResumeItem(
                              Icons.location_on,
                              'Route Jarak',
                              '20 Km',
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mitra MBG 1',
                                    style: AppTheme.bodySmall,
                                  ),
                                  Text(
                                    'Jenis Komoditas',
                                    style: AppTheme.bodySmall,
                                  ),
                                  Text(
                                    'Kapasitas Pesanan',
                                    style: AppTheme.bodySmall,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'SD Negeri 01 Cendana',
                                    style: AppTheme.bodySmall.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Semangka',
                                    style: AppTheme.bodySmall.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '10000 Kg',
                                    style: AppTheme.bodySmall.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                            label: 'Lihat Transaksi',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Lihat Rute Terdekat Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      width: double.infinity,
                      child: Custom3DButton(
                        label: 'Lihat Rute Terdekat',
                        onTap: () {},
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

  Widget _buildActionButton(String label) {
    return SizedBox(
      width: double.infinity,
      child: Custom3DButton(label: label, onTap: () {}, width: double.infinity),
    );
  }

  Widget _buildResumeItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primaryGreen, size: 28),
        const SizedBox(height: 4),
        Text(label, style: AppTheme.bodySmall),
        Text(
          value,
          style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
