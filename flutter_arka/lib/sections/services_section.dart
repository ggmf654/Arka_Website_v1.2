// ignore_for_file: deprecated_member_use, unnecessary_const

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth < 1024;

    final services = [
      ServiceItem(
        icon: Icons.phone_android,
        title: 'Mobile App Development',
        description: 'Native and cross-platform mobile applications built with Flutter and Dart for iOS and Android.',
        technologies: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
      ),
      ServiceItem(
        icon: Icons.language,
        title: 'Web Development',
        description: 'Modern, responsive web applications and platforms using cutting-edge technologies.',
        technologies: ['React', 'Next.js', 'Node.js', 'TypeScript'],
      ),
      ServiceItem(
        icon: Icons.desktop_windows,
        title: 'Desktop Applications',
        description: 'Powerful desktop software solutions for Windows, macOS, and Linux platforms.',
        technologies: ['.NET', 'C#', 'WPF', 'Electron'],
      ),
      ServiceItem(
        icon: Icons.brush,
        title: 'UI/UX Design',
        description: 'User-centered design that creates intuitive, beautiful, and engaging digital experiences.',
        technologies: ['Figma', 'Prototyping', 'User Research', 'Design Systems'],
      ),
      ServiceItem(
        icon: Icons.settings_suggest,
        title: 'System Automation',
        description: 'Streamline operations with custom automation solutions and workflow optimization.',
        technologies: ['Python', 'Power Automate', 'APIs', 'Scripting'],
      ),
      ServiceItem(
        icon: Icons.storage,
        title: 'Database Solutions',
        description: 'Robust database architecture and management for scalable, secure data handling.',
        technologies: ['SQL Server', 'PostgreSQL', 'MongoDB', 'Firebase'],
      ),
    ];

    int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

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
          
          // Services Grid
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: services.map((service) {
                  double cardWidth = isMobile 
                      ? constraints.maxWidth 
                      : (constraints.maxWidth - (crossAxisCount - 1) * 24) / crossAxisCount;
                  return SizedBox(
                    width: cardWidth,
                    child: _ServiceCard(service: service),
                  );
                }).toList(),
              );
            },
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
            'SERVICES',
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
          'What We Do Best',
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
            'Comprehensive software solutions tailored to your business needs, built with modern technologies and best practices.',
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

class ServiceItem {
  final IconData icon;
  final String title;
  final String description;
  final List<String> technologies;

  ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.technologies,
  });
}

class _ServiceCard extends StatefulWidget {
  final ServiceItem service;

  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _isHovered ? AppTheme.cardLighter : AppTheme.backgroundDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered ? AppTheme.primaryGreen.withOpacity(0.3) : AppTheme.borderColor,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primaryGreen.withOpacity(0.25),
                    blurRadius: 24,
                    offset: const Offset(0, 16),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                widget.service.icon,
                color: AppTheme.primaryGreen,
                size: 24,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Title
            Text(
              widget.service.title,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Description
            Text(
              widget.service.description,
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
              children: widget.service.technologies.map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.cardDark,
                    borderRadius: BorderRadius.circular(4),
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
          ],
        ),
      ),
    );
  }
}
