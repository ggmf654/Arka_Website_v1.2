import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../dashbord_page/dashboard_page.dart';

class NavLink extends StatelessWidget {
  final String text;
  final String section;
  final double fontSize;
  final Function(String) onNavigate;

  const NavLink(
      {super.key,
      required this.text,
      required this.section,
      required this.fontSize,
      required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (section == 'dashboard') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const DashboardPage()),
          );
        } else {
          onNavigate(section);
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: AppTheme.textSecondary,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
      ),
    );
  }
}
