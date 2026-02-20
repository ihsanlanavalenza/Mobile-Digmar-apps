import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';
import '../../models/delivery_route.dart';

class RouteDetailScreen extends StatelessWidget {
  final DeliveryRoute route;

  const RouteDetailScreen({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    Color statusColor = route.status == 'Terkirim'
        ? AppTheme.primaryGreen
        : route.status == 'Dalam Perjalanan'
        ? Colors.orange
        : Colors.grey;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Detail Rute Pengiriman',
          style: AppTheme.heading3.copyWith(color: AppTheme.textPrimaryColor),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.textPrimaryColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Static Route Map Visualization
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFFE8F5E9), const Color(0xFFC8E6C9)],
                ),
              ),
              child: CustomPaint(
                painter: _RouteMapPainter(
                  statusColor: statusColor,
                  isDelivered: route.status == 'Terkirim',
                  progress: route.status == 'Terkirim'
                      ? 1.0
                      : route.status == 'Dalam Perjalanan'
                      ? (route.completedStops / route.totalStops)
                      : 0.0,
                ),
                child: Stack(
                  children: [
                    // Origin Label
                    Positioned(
                      left: 30,
                      bottom: 55,
                      child: _buildMapLabel(
                        route.origin.split('(').first.trim(),
                        Icons.storefront,
                        Colors.blue,
                      ),
                    ),
                    // Destination Label
                    Positioned(
                      right: 30,
                      top: 40,
                      child: _buildMapLabel(
                        route.destination.split(',').first.trim(),
                        Icons.location_on,
                        Colors.red.shade700,
                      ),
                    ),
                    // Truck Icon (current position)
                    Positioned(
                      left: route.status == 'Terkirim'
                          ? MediaQuery.of(context).size.width * 0.65
                          : MediaQuery.of(context).size.width * 0.35,
                      top: route.status == 'Terkirim' ? 80 : 130,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: statusColor.withValues(alpha: 0.4),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.local_shipping,
                          color: statusColor,
                          size: 24,
                        ),
                      ),
                    ),
                    // Distance Badge
                    Positioned(
                      top: 12,
                      left: 12,
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
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.route,
                              size: 14,
                              color: AppTheme.primaryGreen,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${route.totalStops} Pemberhentian',
                              style: AppTheme.bodySmall.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status & Truck ID
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          route.status,
                          style: AppTheme.bodyMedium.copyWith(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        route.truckId,
                        style: AppTheme.heading3.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Route Info
                  _buildTimelineItem(
                    title: 'Titik Awal',
                    description: route.origin,
                    icon: Icons.storefront_outlined,
                    isFirst: true,
                    isLast: false,
                  ),
                  _buildTimelineItem(
                    title: 'Posisi Saat Ini',
                    description: route.currentLocation,
                    icon: Icons.local_shipping_outlined,
                    isFirst: false,
                    isLast: false,
                    isActive: route.status == 'Dalam Perjalanan',
                  ),
                  _buildTimelineItem(
                    title: 'Tujuan',
                    description: route.destination,
                    icon: Icons.location_on_outlined,
                    isFirst: false,
                    isLast: true,
                  ),

                  const SizedBox(height: 32),

                  // Detail Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        _buildDetailRow(
                          'Nama Pengemudi',
                          route.driverName,
                          Icons.person,
                        ),
                        const Divider(height: 24),
                        _buildDetailRow(
                          'Estimasi Tiba',
                          route.estimatedArrival,
                          Icons.access_time,
                        ),
                        const Divider(height: 24),
                        _buildDetailRow(
                          'Pemberhentian',
                          '${route.completedStops} dari ${route.totalStops} Selesai',
                          Icons.route,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Action Buttons
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.primaryGreen),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.call_outlined),
                          color: AppTheme.primaryGreen,
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Custom3DButton(
                          label: 'Hubungi Driver',
                          onTap: () {},
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
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String description,
    required IconData icon,
    bool isFirst = false,
    bool isLast = false,
    bool isActive = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isActive ? AppTheme.primaryGreen : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: isActive ? Colors.white : Colors.grey.shade600,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: Colors.grey.shade300,
                margin: const EdgeInsets.symmetric(vertical: 4),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTheme.bodySmall.copyWith(
                  color: isActive
                      ? AppTheme.primaryGreen
                      : AppTheme.textSecondaryColor,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade600, size: 20),
        const SizedBox(width: 12),
        Column(
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
        ),
      ],
    );
  }

  Widget _buildMapLabel(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            text.length > 18 ? '${text.substring(0, 18)}...' : text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}

class _RouteMapPainter extends CustomPainter {
  final Color statusColor;
  final bool isDelivered;
  final double progress;

  _RouteMapPainter({
    required this.statusColor,
    required this.isDelivered,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw grid lines (road-like)
    final gridPaint = Paint()
      ..color = Colors.green.shade200.withValues(alpha: 0.4)
      ..strokeWidth = 1;

    // Horizontal grid
    for (double y = 0; y < size.height; y += 30) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
    // Vertical grid
    for (double x = 0; x < size.width; x += 30) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    // Draw main road (thick grey line)
    final roadPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final routePath = Path();
    routePath.moveTo(50, size.height - 60);
    routePath.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.45,
    );
    routePath.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.4,
      size.width - 50,
      60,
    );
    canvas.drawPath(routePath, roadPaint);

    // Draw route line on top of road (green dashed)
    final routePaint = Paint()
      ..color = statusColor == Colors.grey ? AppTheme.primaryGreen : statusColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(routePath, routePaint);

    // Draw waypoint dots
    final dotPaint = Paint()..style = PaintingStyle.fill;

    // Origin dot
    dotPaint.color = Colors.blue;
    canvas.drawCircle(Offset(50, size.height - 60), 8, dotPaint);
    dotPaint.color = Colors.white;
    canvas.drawCircle(Offset(50, size.height - 60), 4, dotPaint);

    // Mid waypoints
    dotPaint.color = Colors.green.shade300;
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.45),
      5,
      dotPaint,
    );

    // Destination dot
    dotPaint.color = Colors.red.shade700;
    canvas.drawCircle(Offset(size.width - 50, 60), 8, dotPaint);
    dotPaint.color = Colors.white;
    canvas.drawCircle(Offset(size.width - 50, 60), 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
