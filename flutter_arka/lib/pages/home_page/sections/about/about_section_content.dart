import 'package:flutter/material.dart';

import '../../../../constants/responsive_scope.dart';
import '../../../../theme/app_theme.dart';
import 'about_section_value_item.dart';

class AboutSectionContent extends StatelessWidget {
  final ResponsiveData data;
  final bool isCentered;

  const AboutSectionContent(
      {super.key, required this.data, required this.isCentered});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
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
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
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
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Our team of skilled developers, designers, and strategists work collaboratively to understand your unique challenges and build custom solutions that drive growth and efficiency.',
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 32),
        const AboutSectionValueItem(
          icon: Icons.lightbulb_outline,
          title: 'Innovation First',
          description:
              'We stay ahead of technology trends to deliver cutting-edge solutions.',
          isCentered: false,
        ),

        const SizedBox(height: 20),
        const AboutSectionValueItem(
          icon:  Icons.handshake_outlined,
          title:  'Client Partnership',
          description:
          'We work as an extension of your team, invested in your success.',
          isCentered: false,
        ),
        const SizedBox(height: 20),
        const AboutSectionValueItem(
          icon:  Icons.verified_outlined,
          title:      'Quality Assured',
          description:
          'Every line of code is crafted with care and thoroughly tested.',
          isCentered: false,
        ),
      ],
    );
  }
}
