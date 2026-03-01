import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../dashbord_page/dashboard_page.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final String section;
  final Function(String) onNavigate;

  const DrawerItem({super.key, required this.text, required this.section, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        if (section == 'dashboard') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const DashboardPage()),
          );
        } else {
          onNavigate(section);
        }
      },
    );
  }
}
