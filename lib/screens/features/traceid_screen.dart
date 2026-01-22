import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/app_theme.dart';

class TraceIDScreen extends StatefulWidget {
  const TraceIDScreen({super.key});

  @override
  State<TraceIDScreen> createState() => _TraceIDScreenState();
}

class _TraceIDScreenState extends State<TraceIDScreen> {
  final TextEditingController _traceIdController = TextEditingController();
  bool _isTracking = false;

  final List<Map<String, dynamic>> _trackingHistory = [
    {
      'stage': 'Penanaman',
      'location': 'Lahan Petani A, Kedungsari',
      'date': '15 Jan 2024',
      'status': 'Selesai',
      'icon': Icons.agriculture,
    },
    {
      'stage': 'Pemanenan',
      'location': 'Lahan Petani A, Kedungsari',
      'date': '20 Mar 2024',
      'status': 'Selesai',
      'icon': Icons.shopping_basket,
    },
    {
      'stage': 'Pengolahan',
      'location': 'Penggilingan Padi Jaya',
      'date': '22 Mar 2024',
      'status': 'Selesai',
      'icon': Icons.factory,
    },
    {
      'stage': 'Pengemasan',
      'location': 'Gudang Distribusi Utama',
      'date': '25 Mar 2024',
      'status': 'Selesai',
      'icon': Icons.inventory_2,
    },
    {
      'stage': 'Distribusi',
      'location': 'Toko Tani Makmur',
      'date': '27 Mar 2024',
      'status': 'Dalam Proses',
      'icon': Icons.local_shipping,
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TraceID',
                      style: AppTheme.heading1.copyWith(
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Lacak Perjalanan Produk Pertanian',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // QR Code Scanner Placeholder
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.primaryGreen.withOpacity(0.3),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            size: 80,
                            color: AppTheme.primaryGreen.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Scan QR Code Produk',
                            style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.primaryGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                _isTracking = true;
                                _traceIdController.text = 'TRACE-2024-001';
                              });
                            },
                            icon: const Icon(Icons.camera_alt),
                            label: const Text('Buka Kamera'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryGreen,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Manual Input
                    Text(
                      'atau Masukkan Kode Pelacakan',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _traceIdController,
                            decoration: InputDecoration(
                              hintText: 'Contoh: TRACE-2024-001',
                              prefixIcon: const Icon(Icons.tag),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppTheme.primaryGreen,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            if (_traceIdController.text.isNotEmpty) {
                              setState(() {
                                _isTracking = true;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryGreen,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                          child: const Text('Lacak'),
                        ),
                      ],
                    ),

                    if (_isTracking) ...[
                      const SizedBox(height: 32),

                      // Product Info
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.primaryGreen.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.rice_bowl,
                                size: 32,
                                color: AppTheme.primaryGreen,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Beras Premium',
                                    style: AppTheme.heading2.copyWith(
                                      color: AppTheme.primaryGreen,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Kode: ${_traceIdController.text}',
                                    style: AppTheme.bodySmall.copyWith(
                                      color: AppTheme.textSecondaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Produksi: Kedungsari, Jawa Timur',
                                    style: AppTheme.bodySmall.copyWith(
                                      color: AppTheme.textSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Tracking Timeline
                      Text(
                        'Riwayat Pelacakan',
                        style: AppTheme.heading2.copyWith(
                          color: AppTheme.primaryGreen,
                        ),
                      ),
                      const SizedBox(height: 16),

                      ..._trackingHistory.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        final isLast = index == _trackingHistory.length - 1;
                        return _buildTrackingItem(
                          item['stage'],
                          item['location'],
                          item['date'],
                          item['status'],
                          item['icon'],
                          isLast,
                        );
                      }).toList(),
                    ],

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Footer SVG
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Transform.translate(
              offset: const Offset(0, 50),
              child: Image.asset(
                'assets/images/Buttom page.png',
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingItem(
    String stage,
    String location,
    String date,
    String status,
    IconData icon,
    bool isLast,
  ) {
    final isCompleted = status == 'Selesai';
    final color = isCompleted ? AppTheme.primaryGreen : Colors.orange;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: color.withOpacity(0.3),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
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
                      Expanded(
                        child: Text(
                          stage,
                          style: AppTheme.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          status,
                          style: AppTheme.bodySmall.copyWith(
                            color: color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: AppTheme.textSecondaryColor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.textSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: AppTheme.textSecondaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: AppTheme.bodySmall.copyWith(
                          color: AppTheme.textSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _traceIdController.dispose();
    super.dispose();
  }
}
