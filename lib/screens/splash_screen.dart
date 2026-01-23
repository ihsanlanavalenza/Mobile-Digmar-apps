import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
      ),
    );

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    // Start animation
    _controller.forward();

    // Auto navigate to login after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOutCubic;
              var slideTween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var fadeTween = Tween<double>(begin: 0.0, end: 1.0);

              return SlideTransition(
                position: animation.drive(slideTween),
                child: FadeTransition(
                  opacity: animation.drive(fadeTween),
                  child: child,
                ),
              );
            },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

          // Main Content - Onboard SVG with animations
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(scale: _scaleAnimation, child: child),
                );
              },
              child: Column(
                children: [
                  // Onboard Image
                  SizedBox(
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
          ),

          const Spacer(),

          // Footer Image
          SizedBox(
            width: double.infinity,
            height: 150,
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
}
