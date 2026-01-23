import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AgriMapScreen extends StatefulWidget {
  const AgriMapScreen({super.key});

  @override
  State<AgriMapScreen> createState() => _AgriMapScreenState();
}

class _AgriMapScreenState extends State<AgriMapScreen> {
  final List<Map<String, dynamic>> suppliers = [
    {
      'name': 'SD Negeri 05 Kedungsari',
      'location': 'Kedungasari',
      'products': ['Beras', 'Sayur', 'Buah'],
      'distance': '2.5 km',
    },
    {
      'name': 'Koperasi Tani Maju',
      'location': 'Kedungasari',
      'products': ['Beras', 'Jagung'],
      'distance': '3.2 km',
    },
    {
      'name': 'Kelompok Tani Sejahtera',
      'location': 'Kedungasari',
      'products': ['Sayur', 'Buah', 'Rempah'],
      'distance': '1.8 km',
    },
  ];

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Map Placeholder
                  Container(
                    height: 250,
                    width: double.infinity,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.map,
                                size: 64,
                                color: AppTheme.primaryGreen,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Peta Kedungasari',
                                style: AppTheme.heading2.copyWith(
                                  color: AppTheme.primaryGreen,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Area Mapping Supplier',
                                style: AppTheme.bodyMedium.copyWith(
                                  color: AppTheme.textSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: AppTheme.primaryGreen,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Kedungasari',
                                  style: AppTheme.bodySmall.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Daftar Supplier',
                              style: AppTheme.heading2.copyWith(
                                color: AppTheme.primaryGreen,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_list, size: 18),
                              label: const Text('Filter'),
                              style: TextButton.styleFrom(
                                foregroundColor: AppTheme.primaryGreen,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Supplier Cards
                        ...suppliers.map(
                          (supplier) => _buildSupplierCard(
                            supplier['name'],
                            supplier['location'],
                            supplier['products'],
                            supplier['distance'],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
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

  Widget _buildSupplierCard(
    String name,
    String location,
    List<String> products,
    String distance,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.store,
                  color: AppTheme.primaryGreen,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTheme.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: AppTheme.textSecondaryColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.textSecondaryColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.navigation_outlined,
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Potensi Supplier:',
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.textSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: products.map((product) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.accentGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  product,
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.primaryGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Membuka lokasi $name...')),
                    );
                  },
                  icon: const Icon(Icons.map_outlined, size: 18),
                  label: const Text('Lihat Lokasi'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.primaryGreen,
                    side: BorderSide(color: AppTheme.primaryGreen),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Menghubungi $name...')),
                    );
                  },
                  icon: const Icon(Icons.phone, size: 18),
                  label: const Text('Hubungi'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
