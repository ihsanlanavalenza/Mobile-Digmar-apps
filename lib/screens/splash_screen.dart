import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Auto navigate to login after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Image
          Container(
            width: double.infinity,
            height: 120,
            color: Colors.white,
            child: Image.asset(
              'assets/images/Header Aplikasi.png',
              fit: BoxFit.cover,
            ),
          ),

          const Spacer(),

          // Main Content - Onboard SVG
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                // Onboard Image
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/Onborad.png',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 40),

                // Title
                Text(
                  'WELCOME TO THE',
                  style: AppTheme.heading2.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'AGRIWORLD',
                  style: AppTheme.heading1.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryGreen,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                // Slogan
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: AppTheme.primaryGreen.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Dari Petani Untuk Indonesia',
                    style: AppTheme.bodyLarge.copyWith(
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Footer Image
          Container(
            width: double.infinity,
            height: 100,
            child: Image.asset(
              'assets/images/Buttom page.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
