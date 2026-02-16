import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import 'models/process_step.dart';

class ProcessStepNumber extends StatelessWidget {
  final bool isHovered;
  final ProcessStep step;

  const ProcessStepNumber({
    super.key,
    required this.isHovered,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: isHovered ? AppTheme.primaryGreen : AppTheme.cardDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isHovered ? AppTheme.primaryGreen : AppTheme.borderColor,
        ),
        boxShadow: isHovered
            ? [
          BoxShadow(
            color: AppTheme.primaryGreen.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ]
            : [],
      ),
      child: Center(
        child: Text(
          step.number,
          style: TextStyle(
            color: isHovered ? AppTheme.backgroundDark : AppTheme.primaryGreen,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
