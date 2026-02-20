import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/commodity.dart';
import '../../models/learning_module.dart';
import '../../services/dummy_data_service.dart';
import 'module_detail_screen.dart';
import 'video_list_screen.dart';
import 'learning_material_screen.dart';

class AgriLearnScreen extends StatefulWidget {
  const AgriLearnScreen({super.key});

  @override
  State<AgriLearnScreen> createState() => _AgriLearnScreenState();
}

class _AgriLearnScreenState extends State<AgriLearnScreen> {
  String _selectedCommodityId = 'tomat-apel';
  late Commodity _selectedCommodity;
  late List<LearningModule> _modules;

  @override
  void initState() {
    super.initState();
    _updateCommodityData();
  }

  void _updateCommodityData() {
    _selectedCommodity =
        DummyDataService.getCommodityById(_selectedCommodityId) ??
        DummyDataService.commodities.first;
    _modules = DummyDataService.getModulesForCommodity(_selectedCommodityId);
  }

  void _showCommodityPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Pilih Komoditas',
                style: AppTheme.heading3.copyWith(
                  color: AppTheme.primaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...DummyDataService.commodities.map((c) {
                final isSelected = c.id == _selectedCommodityId;
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.primaryGreen
                          : AppTheme.primaryGreen.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: c.imagePath.isNotEmpty
                          ? Image.asset(
                              c.imagePath,
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                    c.icon ?? Icons.eco,
                                    color: isSelected
                                        ? Colors.white
                                        : AppTheme.primaryGreen,
                                    size: 22,
                                  ),
                            )
                          : Icon(
                              c.icon ?? Icons.eco,
                              color: isSelected
                                  ? Colors.white
                                  : AppTheme.primaryGreen,
                              size: 22,
                            ),
                    ),
                  ),
                  title: Text(
                    c.name,
                    style: TextStyle(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected
                          ? AppTheme.primaryGreen
                          : AppTheme.textPrimaryColor,
                    ),
                  ),
                  subtitle: Text(c.category, style: AppTheme.bodySmall),
                  trailing: isSelected
                      ? Icon(Icons.check_circle, color: AppTheme.primaryGreen)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedCommodityId = c.id;
                      _updateCommodityData();
                    });
                    Navigator.pop(ctx);
                  },
                );
              }),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  void _navigateToModule(LearningModule module) {
    Widget screen;
    switch (module.type) {
      case ModuleType.budidaya:
        screen = ModuleDetailScreen(module: module);
        break;
      case ModuleType.video:
        screen = VideoListScreen(module: module);
        break;
      case ModuleType.materi:
        screen = LearningMaterialScreen(module: module);
        break;
    }
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
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
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  // Title
                  Text(
                    'AGRILEARN',
                    style: AppTheme.heading2.copyWith(
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Komoditas Selector (tap to open bottom sheet)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: _showCommodityPicker,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
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
                          border: Border.all(
                            color: AppTheme.primaryGreen.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: AppTheme.primaryGreen,
                              size: 22,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                _selectedCommodity.name,
                                style: AppTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.textPrimaryColor,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: AppTheme.primaryGreen,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Commodity Info Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppTheme.primaryGreen.withValues(alpha: 0.15),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Commodity Image/Icon
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryGreen.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: _selectedCommodity.imagePath.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      _selectedCommodity.imagePath,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) => Icon(
                                            _selectedCommodity.icon ??
                                                Icons.local_florist,
                                            size: 40,
                                            color: AppTheme.primaryGreen,
                                          ),
                                    ),
                                  )
                                : Icon(
                                    _selectedCommodity.icon ??
                                        Icons.local_florist,
                                    size: 40,
                                    color: AppTheme.primaryGreen,
                                  ),
                          ),
                          const SizedBox(width: 16),
                          // Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _selectedCommodity.name,
                                  style: AppTheme.heading3.copyWith(
                                    color: AppTheme.primaryGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _selectedCommodity.category,
                                  style: AppTheme.bodySmall.copyWith(
                                    color: AppTheme.primaryGreen,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Masa panen: ${_selectedCommodity.growthDurationDays} hari',
                                  style: AppTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Section Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pilih Modul Pembelajaran',
                        style: AppTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimaryColor,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Module Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: _modules.map((module) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _buildModuleButton(module),
                        );
                      }).toList(),
                    ),
                  ),

                  // "Under development" message for commodities without modules
                  if (_modules.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.construction,
                              size: 40,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Modul untuk komoditas ini\nsedang dalam pengembangan',
                              style: AppTheme.bodyMedium.copyWith(
                                color: AppTheme.textSecondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  // Navigation Buttons (3D gradient style)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: _build3DButton(
                            label: 'Kembali Keberanda',
                            icon: Icons.home,
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _build3DButton(
                            label: 'Lihat Kebutuhan',
                            icon: Icons.visibility,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Fitur Lihat Kebutuhan dalam pengembangan',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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

  // =========== 3D GRADIENT BUTTON ===========
  Widget _build3DButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            // Bottom shadow (3D depth)
            BoxShadow(
              color: AppTheme.primaryGreen.withValues(alpha: 0.5),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
            // Subtle outer glow
            BoxShadow(
              color: AppTheme.primaryGreen.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF4CAF50), // lighter top
                Color(0xFF2D5F3F), // darker bottom
              ],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.15),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
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

  // =========== MODULE BUTTON with 3D Effect ===========
  Widget _buildModuleButton(LearningModule module) {
    IconData icon;
    String subtitle;
    switch (module.type) {
      case ModuleType.budidaya:
        icon = Icons.agriculture;
        subtitle = '${module.steps?.length ?? 0} langkah praktis';
        break;
      case ModuleType.video:
        icon = Icons.play_circle;
        subtitle = '${module.videos?.length ?? 0} video pembelajaran';
        break;
      case ModuleType.materi:
        icon = Icons.menu_book;
        subtitle = '${module.articles?.length ?? 0} artikel & referensi';
        break;
    }

    return GestureDetector(
      onTap: () => _navigateToModule(module),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            // 3D depth shadow
            BoxShadow(
              color: AppTheme.primaryGreen.withValues(alpha: 0.5),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: AppTheme.primaryGreen.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF4CAF50), // lighter
                Color(0xFF2D5F3F), // darker
              ],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.15),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              Icon(icon, color: Colors.white, size: 26),
              const SizedBox(height: 6),
              // Title (centered)
              Text(
                module.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              // Subtitle (centered)
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12,
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
