import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';

class TeamHeader extends StatelessWidget {
  const TeamHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'OUR TEAM',
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
          'Meet The Experts Behind Our Success',
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
            'Our talented professionals combine technical expertise, creativity, and strategic thinking to deliver exceptional digital solutions.',
            textAlign: TextAlign.center,
            style: TextStyle(
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