import 'process_step_number.dart';
import 'process_content.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import 'models/process_step.dart';

class ProcessMobileCard extends StatelessWidget {
  final bool isLast;
  final bool isHovered;
  final ProcessStep step; // <-- add this

  const ProcessMobileCard({
    super.key,
    required this.isLast,
    required this.isHovered,
    required this.step, // <-- required in constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ProcessStepNumber(isHovered: isHovered, step: step),
                if (!isLast)
                  Container(width: 2, height: 100, color: AppTheme.borderColor),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(child: ProcessContent(step: step)),
          ],
        ),
        if (!isLast) const SizedBox(height: 16),
      ],
    );
  }
}
