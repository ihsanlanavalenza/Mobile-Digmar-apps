import 'package:flutter/material.dart';
import '../../models/learning_module.dart';
import '../../theme/app_theme.dart';

class LearningMaterialScreen extends StatelessWidget {
  final LearningModule module;

  const LearningMaterialScreen({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
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
                  const SizedBox(height: 12),

                  // Title
                  Text(
                    module.title,
                    style: AppTheme.heading2.copyWith(
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      module.description,
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textSecondaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Article List
                  if (module.articles != null)
                    ...module.articles!.map(
                      (article) => _buildArticleCard(context, article),
                    ),

                  const SizedBox(height: 20),

                  // Back Button (3D gradient)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryGreen.withValues(
                                alpha: 0.5,
                              ),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                            BoxShadow(
                              color: AppTheme.primaryGreen.withValues(
                                alpha: 0.2,
                              ),
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
                              colors: [Color(0xFF4CAF50), Color(0xFF2D5F3F)],
                            ),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.15),
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Kembali',
                                style: TextStyle(
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
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Footer
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

  Widget _buildArticleCard(BuildContext context, ArticleItem article) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _ArticleDetailPage(article: article),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.12),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Category icon
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getCategoryIcon(article.category),
                    color: AppTheme.primaryGreen,
                    size: 26,
                  ),
                ),

                const SizedBox(width: 14),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          article.category,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryGreen,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Title
                      Text(
                        article.title,
                        style: AppTheme.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimaryColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      // Read time
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 14,
                            color: AppTheme.textSecondaryColor,
                          ),
                          const SizedBox(width: 4),
                          Text(article.readTime, style: AppTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),

                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Pengetahuan Dasar':
        return Icons.menu_book;
      case 'Teknik Budidaya':
        return Icons.agriculture;
      case 'Teknologi Digital':
        return Icons.devices;
      case 'Pemasaran':
        return Icons.storefront;
      case 'Manajemen':
        return Icons.account_balance;
      default:
        return Icons.article;
    }
  }
}

// ==================== ARTICLE DETAIL PAGE ====================

class _ArticleDetailPage extends StatelessWidget {
  final ArticleItem article;

  const _ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        article.category,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Title
                    Text(
                      article.title,
                      style: AppTheme.heading3.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Read time
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 16,
                          color: AppTheme.textSecondaryColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Waktu baca: ${article.readTime}',
                          style: AppTheme.bodySmall,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Divider
                    Container(height: 1, color: Colors.grey.shade200),

                    const SizedBox(height: 20),

                    // Content
                    Text(
                      article.content,
                      style: AppTheme.bodyMedium.copyWith(
                        height: 1.7,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Back Button (3D gradient)
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryGreen.withValues(
                                alpha: 0.5,
                              ),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                            BoxShadow(
                              color: AppTheme.primaryGreen.withValues(
                                alpha: 0.2,
                              ),
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
                              colors: [Color(0xFF4CAF50), Color(0xFF2D5F3F)],
                            ),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.15),
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Kembali ke Daftar Materi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),

          // Footer
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
}
