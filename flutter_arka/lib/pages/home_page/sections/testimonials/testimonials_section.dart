
import '../../../../constants/const_data.dart';
import 'navigation_dots.dart';
import 'testimonial_card_compact.dart';
import 'testimonials_header.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../../../../constants/responsive_scope.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final int _currentIndex = 0;

  final testimonials = ConstData.testimonials;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveScope.of(context);
    final isMobile = responsive.isMobile;
    final isTablet = responsive.isTablet;

    final horizontalPadding = isMobile ? 24.0 : 48.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 80,
      ),
      color: AppTheme.cardDark,
      child: Column(
        children: [
          const TestimonialsHeader(),
          const SizedBox(height: 60),
          TestimonialCardCompact(
            isMobile: isMobile,
            isTablet: isTablet,
            currentIndex: _currentIndex,
          ),
          const SizedBox(height: 32),
          NavigationDots(
              currentIndex: _currentIndex, testimonials: testimonials),
        ],
      ),
    );
  }
}
