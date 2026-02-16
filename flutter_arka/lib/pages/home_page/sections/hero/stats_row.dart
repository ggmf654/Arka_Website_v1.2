import 'package:flutter/material.dart';
import '../../../../constants/responsive_scope.dart';
import '../../../../theme/app_theme.dart';

class StatsRow extends StatelessWidget {
  final ResponsiveData responsive;

  const StatsRow({super.key, required this.responsive});

  // Helper method to create a stat widget
  Widget stat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppTheme.primaryGreen,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (responsive.isMobile) {
      return Column(
        children: [
          stat('50+', 'Projects Delivered'),
          const SizedBox(height: 24),
          const Divider(color: AppTheme.borderColor),
          const SizedBox(height: 24),
          stat('98%', 'Client Satisfaction'),
          const SizedBox(height: 24),
          const Divider(color: AppTheme.borderColor),
          const SizedBox(height: 24),
          stat('5+', 'Years Experience'),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        stat('50+', 'Projects Delivered'),
        Container(width: 1, height: 50, color: AppTheme.borderColor),
        stat('98%', 'Client Satisfaction'),
        Container(width: 1, height: 50, color: AppTheme.borderColor),
        stat('5+', 'Years Experience'),
      ],
    );
  }
}
