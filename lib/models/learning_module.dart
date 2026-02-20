class LearningModule {
  final String id;
  final String title;
  final String commodityId;
  final ModuleType type;
  final String description;
  final List<ModuleStep>? steps;
  final List<VideoItem>? videos;
  final List<ArticleItem>? articles;

  const LearningModule({
    required this.id,
    required this.title,
    required this.commodityId,
    required this.type,
    required this.description,
    this.steps,
    this.videos,
    this.articles,
  });
}

enum ModuleType { budidaya, video, materi }

class ModuleStep {
  final int stepNumber;
  final String title;
  final String description;
  final String tips;
  final String iconName;

  const ModuleStep({
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.tips,
    required this.iconName,
  });
}

class VideoItem {
  final String id;
  final String title;
  final String duration;
  final String description;
  final String thumbnailIcon;
  final String? youtubeUrl;

  const VideoItem({
    required this.id,
    required this.title,
    required this.duration,
    required this.description,
    required this.thumbnailIcon,
    this.youtubeUrl,
  });
}

class ArticleItem {
  final String id;
  final String title;
  final String content;
  final String category;
  final String readTime;

  const ArticleItem({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.readTime,
  });
}
