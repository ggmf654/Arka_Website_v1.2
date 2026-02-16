// ignore_for_file: deprecated_member_use, prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth < 1024;

    final projects = [
      ProjectItem(
        title: 'HealthTrack Pro',
        category: 'Mobile App',
        description: 'A comprehensive health monitoring app with real-time vitals tracking, medication reminders, and doctor consultations.',
        technologies: ['Flutter', 'Firebase', 'REST APIs'],
        color: const Color(0xFF4A90A4),
      ),
      ProjectItem(
        title: 'RetailFlow ERP',
        category: 'Desktop Application',
        description: 'Enterprise resource planning system for retail businesses with inventory management, POS, and analytics.',
        technologies: ['.NET', 'C#', 'SQL Server', 'WPF'],
        color: const Color(0xFF7B68EE),
      ),
      ProjectItem(
        title: 'EduLearn Platform',
        category: 'Web Application',
        description: 'Interactive e-learning platform with live classes, course management, and student progress tracking.',
        technologies: ['React', 'Node.js', 'MongoDB', 'WebRTC'],
        color: const Color(0xFFE8A87C),
      ),
      ProjectItem(
        title: 'LogiTrack Fleet',
        category: 'Mobile & Web',
        description: 'Real-time fleet management system with GPS tracking, route optimization, and driver management.',
        technologies: ['Flutter', 'Next.js', 'PostgreSQL', 'Google Maps'],
        color: const Color(0xFF41B883),
      ),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 80,
      ),
      color: AppTheme.cardDark,
      child: Column(
        children: [
          // Section Header
          _buildSectionHeader(),
          
          const SizedBox(height: 60),
          
          // Projects Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = isMobile ? 1 : (isTablet ? 1 : 2);
              double spacing = 24;
              double cardWidth = crossAxisCount == 1
                  ? constraints.maxWidth
                  : (constraints.maxWidth - spacing) / 2;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: projects.map((project) {
                  return SizedBox(
                    width: cardWidth,
                    child: _ProjectCard(project: project),
                  );
                }).toList(),
              );
            },
          ),
          
          const SizedBox(height: 48),
          
          // View All Button
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('View All Projects'),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'PORTFOLIO',
            style: TextStyle(
              color: AppTheme.primaryGreen,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Featured Projects',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: const Text(
            'A selection of our recent work showcasing our expertise across different platforms and industries.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectItem {
  final String title;
  final String category;
  final String description;
  final List<String> technologies;
  final Color color;

  ProjectItem({
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.color,
  });
}

class _ProjectCard extends StatefulWidget {
  final ProjectItem project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppTheme.backgroundDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? widget.project.color.withOpacity(0.5) : AppTheme.borderColor,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.project.color.withOpacity(0.25),
                    blurRadius: 24,
                    offset: const Offset(0, 16),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Preview Area
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.project.color.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Stack(
                children: [
                  // Decorative elements
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: widget.project.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    child: Container(
                      width: 120,
                      height: 60,
                      decoration: BoxDecoration(
                        color: widget.project.color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  // Category Badge
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: widget.project.color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        widget.project.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Project Info
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.title,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.project.description,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Technologies
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.technologies.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.cardDark,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppTheme.borderColor),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // View Project Link
                  Row(
                    children: [
                      Text(
                        'View Case Study',
                        style: TextStyle(
                          color: widget.project.color,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: widget.project.color,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
