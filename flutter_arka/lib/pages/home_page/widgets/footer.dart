import 'package:arka_website/pages/home_page/widgets/footer_desktop.dart';
import 'package:arka_website/pages/home_page/widgets/footer_tablet.dart';
import 'package:flutter/material.dart';
import '../../../constants/responsive_scope.dart';
import '../../../theme/app_theme.dart';
import 'copy_right.dart';
import 'footer_mobile.dart';
import 'legal_links.dart';

class ArkaFooter extends StatelessWidget {
  const ArkaFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ResponsiveScope.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: data.isMobile ? 24 : 48,
        vertical: 48,
      ),
      color: AppTheme.cardDark,
      child: Column(
        children: [
          // Footer main content based on device type
          data.isMobile
              ? const FooterMobile()
              : data.isTablet
              ? const FooterTablet()
              : const FooterDesktop(),
          const SizedBox(height: 40),
          Container(height: 1, color: AppTheme.borderColor),
          const SizedBox(height: 24),
          // Legal and copyright
          data.isMobile
              ? const Column(
            children: [
              CopyRight(),
              SizedBox(height: 16),
              LegalLinks(),
            ],
          )
              : const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CopyRight(),
              LegalLinks(),
            ],
          ),
        ],
      ),
    );
  }
}