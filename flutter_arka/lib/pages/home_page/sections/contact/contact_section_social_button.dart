import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';

class ContactSectionSocialButton extends StatelessWidget {
  final IconData icon;
      final String label;
  const ContactSectionSocialButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppTheme.textSecondary, size: 20),
        onPressed: () {},
        tooltip: label,
      ),
    );
  }
}
