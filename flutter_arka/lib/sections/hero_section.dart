// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onGetStarted;
  final VoidCallback onViewWork;

  const HeroSection({
    super.key,
    required this.onGetStarted,
    required this.onViewWork,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 80 : 120,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF101216),
            AppTheme.backgroundDark,
          ],
        ),
      ),
      child: Column(
        children: [
          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.primaryGreen.withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryGreen,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Building Digital Excellence',
                  style: TextStyle(
                    color: AppTheme.primaryGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Main Headline
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            tween: Tween(begin: 20, end: 0),
            builder: (context, value, child) {
              return Opacity(
                opacity: (1 - (value / 20)).clamp(0.0, 1.0),
                child: Transform.translate(
                  offset: Offset(0, value),
                  child: child,
                ),
              );
            },
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Text(
                'We Build Software\nThat Drives Growth',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: isMobile ? 36 : (isTablet ? 48 : 64),
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                  letterSpacing: -1,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Subheadline
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            tween: Tween(begin: 20, end: 0),
            builder: (context, value, child) {
              return Opacity(
                opacity: (1 - (value / 20)).clamp(0.0, 1.0),
                child: Transform.translate(
                  offset: Offset(0, value),
                  child: child,
                ),
              );
            },
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                'From concept to deployment, we transform your ideas into powerful digital solutions. Mobile apps, web platforms, and enterprise systems built with modern technologies.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: isMobile ? 16 : 18,
                  height: 1.6,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 40),
          
          // CTA Buttons
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onGetStarted,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Start Your Project'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: onViewWork,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                ),
                child: const Text('View Our Work'),
              ),
            ],
          ),
          
          const SizedBox(height: 80),
          
          // Stats Row
          _buildStatsRow(isMobile),
        ],
      ),
    );
  }

  Widget _buildStatsRow(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: isMobile
          ? Column(
              children: [
                _statItem('50+', 'Projects Delivered'),
                const SizedBox(height: 24),
                const Divider(color: AppTheme.borderColor),
                const SizedBox(height: 24),
                _statItem('98%', 'Client Satisfaction'),
                const SizedBox(height: 24),
                const Divider(color: AppTheme.borderColor),
                const SizedBox(height: 24),
                _statItem('5+', 'Years Experience'),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _statItem('50+', 'Projects Delivered'),
                Container(width: 1, height: 50, color: AppTheme.borderColor),
                _statItem('98%', 'Client Satisfaction'),
                Container(width: 1, height: 50, color: AppTheme.borderColor),
                _statItem('5+', 'Years Experience'),
              ],
            ),
    );
  }

  Widget _statItem(String value, String label) {
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
}
