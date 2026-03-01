import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';

class LegalLinks extends StatelessWidget {
  const LegalLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Privacy Policy',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(width: 16),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Terms of Service',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
