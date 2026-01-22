import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';
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
    {
      'name': 'AgriMap',
      'icon': 'assets/images/icon fitur /Agrimap.svg',
      'subtitle': 'Peta Pertanian',
    },
    {
      'name': 'DigiMarket',
      'icon': 'assets/images/icon fitur /Digimarket.svg',
      'subtitle': 'Pasar Digital',
    },
    {
      'name': 'RouteSmart',
      'icon': 'assets/images/icon fitur /RouteSmart.svg',
      'subtitle': 'Rute Pintar',
    },
    {
      'name': 'AgriPredicy',
      'icon': 'assets/images/icon fitur /AgriPredicy.svg',
      'subtitle': 'Prediksi Panen',
    },
    {
      'name': 'FoodDash',
      'icon': 'assets/images/icon fitur /FoodDash.svg',
      'subtitle': 'Dashboard Pangan',
    },
    {
      'name': 'TraceID',
      'icon': 'assets/images/icon fitur /TraceID.svg',
      'subtitle': 'Lacak Produk',
    },
    {
      'name': 'AgriLearn',
      'icon': 'assets/images/icon fitur /AgriLearn.svg',
      'subtitle': 'Belajar Pertanian',
    },
  ];

  void _onFeatureTap(String featureName) {
    Widget? screen;

    switch (featureName) {
      case 'AgriMap':
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

    if (screen != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
    }
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
            height: 120,
            child: Image.asset(
              'assets/images/Header Aplikasi.png',
              fit: BoxFit.fill,
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Text
                    Text(
                      'Selamat Datang di',
                      style: AppTheme.bodyLarge.copyWith(
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'DIGMAR',
                      style: AppTheme.heading1.copyWith(
                        fontSize: 32,
                        color: AppTheme.primaryGreen,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Search Bar
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Cari fitur...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: AppTheme.primaryGreen),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Features Grid Title
                    Text(
                      'Fitur Utama',
                      style: AppTheme.heading2.copyWith(
                        color: AppTheme.primaryGreen,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Features Grid (3 columns)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.85,
                          ),
                      itemCount: features.length,
                      itemBuilder: (context, index) {
                        final feature = features[index];
                        return _buildFeatureCard(
                          feature['name'],
                          feature['icon'],
                          feature['subtitle'],
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Show More Button
                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Menampilkan lebih banyak fitur...',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.expand_more),
                        label: const Text('Lihat Lebih Banyak'),
                        style: TextButton.styleFrom(
                          foregroundColor: AppTheme.primaryGreen,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Banner
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.primaryGreen, AppTheme.lightGreen],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Satu Bibit',
                                  style: AppTheme.heading2.copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Untuk Satu Kehidupan',
                                  style: AppTheme.bodyLarge.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.eco, size: 48, color: Colors.white),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Footer SVG
          Transform.translate(
            offset: const Offset(0, 50),
            child: SizedBox(
              width: double.infinity,
              height: 150,
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

  Widget _buildFeatureCard(String name, String iconPath, String subtitle) {
    return InkWell(
      onTap: () => _onFeatureTap(name),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.contain,
                allowDrawingOutsideViewBox: false,
              ),
            ),
            const SizedBox(height: 8),
            // Name
            Text(
              name,
              style: AppTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryGreen,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                subtitle,
                style: AppTheme.bodySmall.copyWith(
                  color: AppTheme.textSecondaryColor,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
