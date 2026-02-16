import '../../../../constants/responsive_scope.dart';
import 'tech_card.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import 'grid_pattern_painter.dart';
class VisualMap extends StatelessWidget {
  final ResponsiveData data;
  const VisualMap({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final isMobile = data.isMobile;
    return Container(
      height: isMobile ? 300 : 500,
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CustomPaint(
                painter: GridPatternPainter(),
              ),
            ),
          ),
          const Positioned(
            top: 40,
            left: 30,
            child: TechCard(label: 'Flutter', icon: Icons.flutter_dash),
          ),
          const Positioned(
            top: 100,
            right: 40,
            child: TechCard(label: '.NET', icon: Icons.code),
          ),
          const Positioned(
            bottom: 120,
            left: 50,
            child: TechCard(label: 'SQL', icon: Icons.storage),
          ),
          const Positioned(
            bottom: 50,
            right: 30,
            child: TechCard(label: 'REST APIs', icon: Icons.api),
          ),
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryGreen.withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'A',
                  style: TextStyle(
                    color: AppTheme.backgroundDark,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
