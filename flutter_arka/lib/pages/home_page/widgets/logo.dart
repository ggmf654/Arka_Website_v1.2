import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../theme/app_theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Image.asset(
                AppImages.logo,
                fit: BoxFit.contain,

              ),
            )),
        const SizedBox(width: 10),
        const Text(
          'ARKA',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
