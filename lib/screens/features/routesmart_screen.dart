import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class RouteSmartScreen extends StatefulWidget {
  const RouteSmartScreen({super.key});

  @override
  State<RouteSmartScreen> createState() => _RouteSmartScreenState();
}

class _RouteSmartScreenState extends State<RouteSmartScreen> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  final List<Map<String, dynamic>> routeOptions = [
    {
      'name': 'Rute Tercepat',
      'distance': '12.5 km',
      'time': '25 menit',
      'cost': 'Rp 15.000',
      'icon': Icons.directions_car,
    },
    {
      'name': 'Rute Terdekat',
      'distance': '10.2 km',
      'time': '30 menit',
      'cost': 'Rp 12.000',
      'icon': Icons.route,
    },
    {
      'name': 'Rute Hemat',
      'distance': '11.8 km',
      'time': '28 menit',
      'cost': 'Rp 10.000',
      'icon': Icons.savings_outlined,
    },
  ];

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header SVG
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/Header Aplikasi.png',
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 8,
                  top: 50,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RouteSmart',
                      style: AppTheme.heading1.copyWith(
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Rute Pintar Distribusi',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Route Input Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // From Field
                          TextField(
                            controller: _fromController,
                            decoration: InputDecoration(
                              labelText: 'Dari',
                              hintText: 'Lokasi awal',
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: AppTheme.primaryGreen,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // To Field
                          TextField(
                            controller: _toController,
                            decoration: InputDecoration(
                              labelText: 'Ke',
                              hintText: 'Tujuan',
                              prefixIcon: Icon(
                                Icons.flag,
                                color: AppTheme.primaryGreen,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Search Route Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Mencari rute terbaik...'),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.search),
                              label: const Text('Cari Rute'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryGreen,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Route Options
                    Text(
                      'Pilihan Rute',
                      style: AppTheme.heading2.copyWith(
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 12),

                    ...routeOptions.map(
                      (route) => _buildRouteCard(
                        route['name'],
                        route['distance'],
                        route['time'],
                        route['cost'],
                        route['icon'],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Footer SVG
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Image.asset(
              'assets/images/Buttom page.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteCard(
    String name,
    String distance,
    String time,
    String cost,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Menggunakan $name...')));
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: AppTheme.primaryGreen, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.straighten,
                            size: 14,
                            color: AppTheme.textSecondaryColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            distance,
                            style: AppTheme.bodySmall.copyWith(
                              color: AppTheme.textSecondaryColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppTheme.textSecondaryColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            time,
                            style: AppTheme.bodySmall.copyWith(
                              color: AppTheme.textSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      cost,
                      style: AppTheme.bodyLarge.copyWith(
                        color: AppTheme.primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppTheme.primaryGreen,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
