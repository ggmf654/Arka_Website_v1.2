import 'package:flutter/material.dart';
import '../../../../constants/const_data.dart';
import '../../../../constants/responsive_scope.dart';
import '../../../../theme/app_theme.dart';
import '../../widgets/navigation_dots.dart';
import 'testimonial_card_compact.dart';
import 'testimonials_header.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int _currentIndex = 0;

  final testimonials = ConstData.testimonials;

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
      color: AppTheme.backgroundDark,
      child: Column(
        children: [
          const TestimonialsHeader(),
          const SizedBox(height: 60),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: TestimonialCardCompact(
              key: ValueKey(_currentIndex),
              isMobile: isMobile,
              isTablet: isTablet,
              currentIndex: _currentIndex,
            ),
          ),
          const SizedBox(height: 32),
          NavigationDots(
            currentIndex: _currentIndex,
            items: testimonials,
            onChanged: _changeIndex,
          ),
        ],
      ),
    );
  }
}
