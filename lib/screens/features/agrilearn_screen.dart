import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AgriLearnScreen extends StatefulWidget {
  const AgriLearnScreen({super.key});

  @override
  State<AgriLearnScreen> createState() => _AgriLearnScreenState();
}

class _AgriLearnScreenState extends State<AgriLearnScreen> {
  String selectedCategory = 'Semua';
  final List<String> categories = [
    'Semua',
    'Budidaya',
    'Hama & Penyakit',
    'Pupuk',
    'Teknologi',
  ];

  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Teknik Budidaya Padi Organik',
      'instructor': 'Dr. Bambang Sutrisno',
      'duration': '45 menit',
      'lessons': '12 materi',
      'rating': 4.8,
      'students': 1250,
      'category': 'Budidaya',
      'image': Icons.grass,
    },
    {
      'title': 'Pengendalian Hama Terpadu',
      'instructor': 'Ir. Siti Nurhaliza',
      'duration': '60 menit',
      'lessons': '15 materi',
      'rating': 4.7,
      'students': 980,
      'category': 'Hama & Penyakit',
      'image': Icons.bug_report,
    },
    {
      'title': 'Pupuk Organik dan Aplikasinya',
      'instructor': 'Prof. Ahmad Dahlan',
      'duration': '40 menit',
      'lessons': '10 materi',
      'rating': 4.9,
      'students': 1500,
      'category': 'Pupuk',
      'image': Icons.spa,
    },
    {
      'title': 'Sistem Irigasi Modern',
      'instructor': 'Dr. Rina Kusuma',
      'duration': '50 menit',
      'lessons': '14 materi',
      'rating': 4.6,
      'students': 750,
      'category': 'Teknologi',
      'image': Icons.water_drop,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header SVG
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/Header Aplikasi.png',
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 8,
                  top: 50,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AgriLearn',
                      style: AppTheme.heading1.copyWith(
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Platform Pembelajaran Pertanian',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Search Bar
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari kursus atau materi...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: AppTheme.primaryGreen,
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Category Chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories.map((category) {
                          final isSelected = category == selectedCategory;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(category),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  selectedCategory = category;
                                });
                              },
                              selectedColor: AppTheme.primaryGreen,
                              labelStyle: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : AppTheme.primaryGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Stats Row
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(Icons.school, '48', 'Kursus'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            Icons.people,
                            '4.5K',
                            'Peserta',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildStatCard(
                            Icons.video_library,
                            '250',
                            'Video',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Courses List
                    Text(
                      'Kursus Populer',
                      style: AppTheme.heading2.copyWith(
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 16),

                    ...courses
                        .map((course) => _buildCourseCard(course))
                        ,

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Footer SVG
          SizedBox(
            width: double.infinity,
            height: 120,
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

  Widget _buildStatCard(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.primaryGreen, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTheme.heading2.copyWith(
              color: AppTheme.primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course Image Placeholder
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    course['image'],
                    size: 60,
                    color: AppTheme.primaryGreen.withOpacity(0.5),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.accentGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      course['category'],
                      style: AppTheme.bodySmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course['title'],
                  style: AppTheme.heading2.copyWith(
                    color: AppTheme.primaryGreen,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 16,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      course['instructor'],
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(course['duration'], style: AppTheme.bodySmall),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.book,
                      size: 16,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(course['lessons'], style: AppTheme.bodySmall),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      course['rating'].toString(),
                      style: AppTheme.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.people,
                      size: 16,
                      color: AppTheme.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${course['students']} peserta',
                      style: AppTheme.bodySmall,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                      ),
                      child: const Text('Mulai'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
