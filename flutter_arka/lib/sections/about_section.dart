// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 80,
      ),
      child: isMobile || isTablet
          ? Column(
              children: [
                _buildContent(isMobile),
                const SizedBox(height: 48),
                _buildVisual(isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildContent(isMobile)),
                const SizedBox(width: 64),
                Expanded(child: _buildVisual(isMobile)),
              ],
            ),
    );
  }

  Widget _buildContent(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'ABOUT US',
            style: TextStyle(
              color: AppTheme.primaryGreen,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Passionate About Building Great Software',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'ARKA is a software development company founded with a mission to help businesses thrive in the digital age. We combine technical expertise with creative problem-solving to deliver solutions that make a real impact.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Our team of skilled developers, designers, and strategists work collaboratively to understand your unique challenges and build custom solutions that drive growth and efficiency.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 32),
        
        // Values
        _buildValueItem(
          icon: Icons.lightbulb_outline,
          title: 'Innovation First',
          description: 'We stay ahead of technology trends to deliver cutting-edge solutions.',
        ),
        const SizedBox(height: 20),
        _buildValueItem(
          icon: Icons.handshake_outlined,
          title: 'Client Partnership',
          description: 'We work as an extension of your team, invested in your success.',
        ),
        const SizedBox(height: 20),
        _buildValueItem(
          icon: Icons.verified_outlined,
          title: 'Quality Assured',
          description: 'Every line of code is crafted with care and thoroughly tested.',
        ),
      ],
    );
  }

  Widget _buildValueItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppTheme.primaryGreen, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVisual(bool isMobile) {
    return Container(
      height: isMobile ? 300 : 500,
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CustomPaint(
                painter: _GridPatternPainter(),
              ),
            ),
          ),
          
          // Tech Stack Floating Cards
          Positioned(
            top: 40,
            left: 30,
            child: _TechCard(label: 'Flutter', icon: Icons.flutter_dash),
          ),
          Positioned(
            top: 100,
            right: 40,
            child: _TechCard(label: '.NET', icon: Icons.code),
          ),
          Positioned(
            bottom: 120,
            left: 50,
            child: _TechCard(label: 'SQL', icon: Icons.storage),
          ),
          Positioned(
            bottom: 50,
            right: 30,
            child: _TechCard(label: 'REST APIs', icon: Icons.api),
          ),
          
          // Center Logo
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

class _TechCard extends StatelessWidget {
  final String label;
  final IconData icon;

  const _TechCard({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.cardLighter,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppTheme.primaryGreen, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.borderColor.withOpacity(0.3)
      ..strokeWidth = 1;

    const spacing = 30.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
