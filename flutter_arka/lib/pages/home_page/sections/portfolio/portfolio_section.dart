import 'package:arka_website/pages/home_page/sections/portfolio/porifolio_header.dart';
import 'package:arka_website/pages/home_page/sections/portfolio/project_card.dart';
import 'package:flutter/material.dart';
import '../../../../constants/responsive_scope.dart';
import '../../../../theme/app_theme.dart';
import 'models/project_item.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ResponsiveScope.of(context);
    final horizontalPadding = data.width *
        (data.isMobile
            ? 0.06
            : data.isTablet
                ? 0.08
                : 0.12);

    final projects = [
      ProjectItem(
        title: 'HealthTrack Pro',
        category: 'Mobile App',
        description:
            'A comprehensive health monitoring app with real-time vitals tracking, medication reminders, and doctor consultations.',
        technologies: ['Flutter', 'Firebase', 'REST APIs'],
        color: const Color(0xFF4A90A4),
      ),
      ProjectItem(
        title: 'RetailFlow ERP',
        category: 'Desktop Application',
        description:
            'Enterprise resource planning system for retail businesses with inventory management, POS, and analytics.',
        technologies: ['.NET', 'C#', 'SQL Server', 'WPF'],
        color: const Color(0xFF7B68EE),
      ),
      ProjectItem(
        title: 'EduLearn Platform',
        category: 'Web Application',
        description:
            'Interactive e-learning platform with live classes, course management, and student progress tracking.',
        technologies: ['React', 'Node.js', 'MongoDB', 'WebRTC'],
        color: const Color(0xFFE8A87C),
      ),
      ProjectItem(
        title: 'LogiTrack Fleet',
        category: 'Mobile & Web',
        description:
            'Real-time fleet management system with GPS tracking, route optimization, and driver management.',
        technologies: ['Flutter', 'Next.js', 'PostgreSQL', 'Google Maps'],
        color: const Color(0xFF41B883),
      ),
    ];

    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 80),
      color: AppTheme.cardDark,
      child: Column(
        children: [
          const PortfolioHeader(),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = data.isMobile ? 1 : (data.isTablet ? 1 : 2);
              double spacing = 24;
              double cardWidth = crossAxisCount == 1
                  ? constraints.maxWidth
                  : (constraints.maxWidth - spacing) / 2;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: projects
                    .map((project) => SizedBox(
                          width: cardWidth,
                          child: ProjectCard(project: project),
                        ))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 48),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
}

