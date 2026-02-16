import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import 'models/process_step.dart';

class ProcessContent extends StatelessWidget {
  final ProcessStep step;
  const ProcessContent({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(step.icon, color: AppTheme.primaryGreen, size: 24),
            const SizedBox(width: 12),
            Text(
              step.title,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          step.description,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ],
    );
  }
  }

