import 'package:arka_website/pages/home_page/sections/hero/cta_buttons.dart';
import 'package:arka_website/pages/home_page/sections/hero/stats_row.dart';
import 'package:flutter/material.dart';
import '../../../../constants/responsive_scope.dart';
import '../../../../theme/app_theme.dart';

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
    final responsive = ResponsiveScope.of(context);

    double horizontalPadding =
        responsive.isMobile ? 24 : (responsive.isTablet ? 48 : 80);
    double verticalPadding =
        responsive.isMobile ? 60 : (responsive.isTablet ? 100 : 140);

    double headlineSize =
        responsive.isMobile ? 36 : (responsive.isTablet ? 48 : 64);
    double subheadlineSize = responsive.isMobile ? 16 : 18;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Badge(),
          const SizedBox(height: 32),
          Text(
            'We Build Software\nThat Drives Growth',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: headlineSize,
              fontWeight: FontWeight.w700,
              height: 1.1,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'From concept to deployment, we transform your ideas into powerful digital solutions. Mobile apps, web platforms, and enterprise systems built with modern technologies.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: subheadlineSize,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 40),
          CtaButtons(onViewWork: onViewWork, onGetStarted: onGetStarted),
          const SizedBox(height: 80),
          StatsRow(responsive: responsive),
        ],
      ),
    );
  }
}
