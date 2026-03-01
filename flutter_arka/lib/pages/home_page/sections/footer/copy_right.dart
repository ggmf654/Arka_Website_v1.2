import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';

class CopyRight extends StatelessWidget {
  const CopyRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '© ${DateTime.now().year} ARKA. All rights reserved.',
      style: const TextStyle(
        color: AppTheme.textMuted,
        fontSize: 13,
      ),
    );
  }
}
