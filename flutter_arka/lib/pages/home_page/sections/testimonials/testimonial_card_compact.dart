import 'package:flutter/material.dart';

import '../../../../constants/const_data.dart';
import '../../../../theme/app_theme.dart';

class TestimonialCardCompact extends StatelessWidget {
  final bool isTablet;
  final bool isMobile;
  final int currentIndex;

  const TestimonialCardCompact(
      {super.key,
      required this.isTablet,
      required this.isMobile,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final testimonial = ConstData.testimonials[currentIndex];

    double fontSize = isMobile
        ? 16
        : isTablet
            ? 18
            : 20;
    double padding = isMobile
        ? 24
        : isTablet
            ? 32
            : 40;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(currentIndex),
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 800),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: AppTheme.backgroundDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderColor),
        ),
        child: Column(
          children: [
            Icon(
              Icons.format_quote,
              color: AppTheme.primaryGreen.withOpacity(0.3),
              size: 48,
            ),
            const SizedBox(height: 24),
            Text(
              testimonial.quote,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: 60,
              height: 2,
              color: AppTheme.primaryGreen,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Text(
                      testimonial.author.substring(0, 1),
                      style: const TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial.author,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      testimonial.role,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
