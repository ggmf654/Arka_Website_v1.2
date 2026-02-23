import 'models/process_step.dart';
import 'process_step_number.dart';
import 'process_content.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';

class ProcessDesktopCard extends StatelessWidget {
  final bool isLast;
  final bool isHovered;
  final ProcessStep step;

  const ProcessDesktopCard({
    super.key,
    required this.isLast,
    required this.isHovered,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Column(
            children: [
              ProcessStepNumber(
                isHovered: isHovered,
                step: step,
              ),
              if (!isLast)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 2,
                  height: 120,
                  color: AppTheme.borderColor,
                ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 35),
            decoration: BoxDecoration(
              color: isHovered
                  ? AppTheme.cardLighter
                  : AppTheme.cardDark,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isHovered
                    ? AppTheme.primaryGreen.withOpacity(0.3)
                    : AppTheme.borderColor,
              ),
              boxShadow: isHovered
                  ? [
                BoxShadow(
                  color:
                  AppTheme.primaryGreen.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                )
              ]
                  : [],
            ),
            child: ProcessContent(step: step),
          ),
        ),
      ],
    );
  }
}
