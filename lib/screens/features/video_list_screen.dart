import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/learning_module.dart';
import '../../theme/app_theme.dart';

class VideoListScreen extends StatelessWidget {
  final LearningModule module;

  const VideoListScreen({super.key, required this.module});

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'eco':
        return Icons.eco;
      case 'landscape':
        return Icons.landscape;
      case 'science':
        return Icons.science;
      case 'bug_report':
        return Icons.bug_report;
      case 'agriculture':
        return Icons.agriculture;
      default:
        return Icons.play_circle;
    }
  }

  Future<void> _openYouTube(BuildContext context, VideoItem video) async {
    if (video.youtubeUrl != null && video.youtubeUrl!.isNotEmpty) {
      final uri = Uri.parse(video.youtubeUrl!);
      try {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tidak dapat membuka YouTube')),
            );
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Gagal membuka video')));
        }
      }
    }
  }

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

                  // Video List
                  if (module.videos != null)
                    ...module.videos!.asMap().entries.map(
                      (entry) =>
                          _buildVideoCard(context, entry.value, entry.key),
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

  Widget _buildVideoCard(BuildContext context, VideoItem video, int index) {
    final hasYoutube = video.youtubeUrl != null && video.youtubeUrl!.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: GestureDetector(
        onTap: () {
          // Show video detail bottom sheet
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (ctx) => _buildVideoDetail(ctx, video),
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
          child: Row(
            children: [
              // Thumbnail
              Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      _getIconData(video.thumbnailIcon),
                      color: AppTheme.primaryGreen.withValues(alpha: 0.3),
                      size: 36,
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: hasYoutube
                            ? const Color(0xFFFF0000)
                            : AppTheme.primaryGreen.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),

              // Info
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.title,
                        style: AppTheme.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimaryColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppTheme.textSecondaryColor,
                          ),
                          const SizedBox(width: 4),
                          Text(video.duration, style: AppTheme.bodySmall),
                          const SizedBox(width: 8),
                          if (hasYoutube)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF0000),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    'YouTube',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.chevron_right, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoDetail(BuildContext context, VideoItem video) {
    final hasYoutube = video.youtubeUrl != null && video.youtubeUrl!.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Video placeholder with YouTube button
          GestureDetector(
            onTap: hasYoutube ? () => _openYouTube(context, video) : null,
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: hasYoutube
                    ? Colors.black87
                    : AppTheme.primaryGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: hasYoutube
                          ? const Color(0xFFFF0000)
                          : AppTheme.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hasYoutube ? 'Tap untuk buka di YouTube' : video.duration,
                    style: TextStyle(
                      color: hasYoutube ? Colors.white : AppTheme.primaryGreen,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  if (hasYoutube) ...[
                    const SizedBox(height: 4),
                    Text(
                      video.duration,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          Text(
            video.title,
            style: AppTheme.heading3.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            video.description,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.textSecondaryColor,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          // Open YouTube button if available
          if (hasYoutube)
            GestureDetector(
              onTap: () => _openYouTube(context, video),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF0000).withValues(alpha: 0.4),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFF1744), Color(0xFFCC0000)],
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
                        Icons.play_circle_filled,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Tonton di YouTube',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
