import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_3d_button.dart';
import 'features/agrimap_screen.dart';
import 'features/digimarket_screen.dart';
import 'features/routesmart_screen.dart';
import 'features/agripredicy_screen.dart';
import 'features/fooddash_screen.dart';
import 'features/traceid_screen.dart';
import 'features/agrilearn_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> features = [
    {'name': 'Agrimap', 'icon': 'assets/images/Menu icon/Agrimap.png'},
    {'name': 'DigiMarket', 'icon': 'assets/images/Menu icon/Digimarket.png'},
    {'name': 'RouteSmart', 'icon': 'assets/images/Menu icon/RouteSmart.png'},
    {'name': 'AgriPredicy', 'icon': 'assets/images/Menu icon/AgriPredicy.png'},
    {'name': 'FoodDash', 'icon': 'assets/images/Menu icon/FoodDash.png'},
    {'name': 'TraceID', 'icon': 'assets/images/Menu icon/TraceID.png'},
    {'name': 'AgriLearn', 'icon': 'assets/images/Menu icon/AgriLearn.png'},
  ];

  void _onFeatureTap(String featureName) {
    Widget? screen;

    switch (featureName) {
      case 'Agrimap':
        screen = const AgriMapScreen();
        break;
      case 'DigiMarket':
        screen = const DigiMarketScreen();
        break;
      case 'RouteSmart':
        screen = const RouteSmartScreen();
        break;
      case 'AgriPredicy':
        screen = const AgriPredicyScreen();
        break;
      case 'FoodDash':
        screen = const FoodDashScreen();
        break;
      case 'TraceID':
        screen = const TraceIDScreen();
        break;
      case 'AgriLearn':
        screen = const AgriLearnScreen();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$featureName sedang dalam pengembangan'),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
    }

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen!,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutCubic;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Search Bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Cari fitur...',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
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

                    const SizedBox(height: 24),

                    // Features Grid (3 columns x 2 rows + 1)
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: features.map((feature) {
                        return _buildFeatureCard(
                          feature['name'],
                          feature['icon'],
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    // Show More Button
                    SizedBox(
                      width: double.infinity,
                      child: Custom3DButton(
                        label: 'Show More',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Menampilkan lebih banyak fitur...',
                              ),
                            ),
                          );
                        },
                        width: double.infinity,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Banner Text
                    Text(
                      'Satu Bibit Untuk Satu Kehidupan',
                      style: AppTheme.heading3.copyWith(
                        color: AppTheme.primaryGreen,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    // Hand holding plant SVG
                    SvgPicture.asset(
                      'assets/images/svg/banner_bibit.svg',
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      placeholderBuilder: (context) => Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.eco,
                            size: 48,
                            color: AppTheme.primaryGreen,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
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

  Widget _buildFeatureCard(String name, String iconPath) {
    return GestureDetector(
      onTap: () => _onFeatureTap(name),
      child: Container(
        width: 105,
        height: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            // Outer shadow (bottom depth)
            BoxShadow(
              color: AppTheme.primaryGreen.withValues(alpha: 0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
            // Mid shadow
            BoxShadow(
              color: AppTheme.primaryGreen.withValues(alpha: 0.2),
              blurRadius: 18,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.primaryGreen.withValues(alpha: 0.9),
                AppTheme.primaryGreen,
              ],
            ),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: Stack(
            children: [
              // Inner highlight (top-left shine)
              Positioned(
                top: 6,
                left: 6,
                right: 35,
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.25),
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              // Content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon Container
                  Center(
                    child: SizedBox(
                      height: 68,
                      width: 68,
                      child: Image.asset(
                        iconPath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.eco,
                              color: Colors.white,
                              size: 45,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Name
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              offset: Offset(0, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
