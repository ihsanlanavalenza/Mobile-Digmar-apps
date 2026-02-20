import 'package:flutter/material.dart';

class Custom3DButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;
  final double? width;
  final List<Color>? gradientColors;
  final EdgeInsetsGeometry? padding;

  const Custom3DButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.width,
    this.gradientColors,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colors =
        gradientColors ??
        const [
          Color(0xFF4CAF50), // lighter top
          Color(0xFF2D5F3F), // darker bottom
        ];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            // Bottom shadow (3D depth)
            BoxShadow(
              color: colors.last.withValues(alpha: 0.5),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
            // Subtle outer glow
            BoxShadow(
              color: colors.first.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors,
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.15),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, color: Colors.white, size: 18),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
