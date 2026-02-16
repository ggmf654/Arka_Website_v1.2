import 'process_header.dart';
import 'process_step_card.dart';
import 'package:flutter/material.dart';
import '../../../../constants/const_data.dart';
import '../../../../constants/responsive_scope.dart';

class ProcessSection extends StatelessWidget {

  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ResponsiveScope.of(context);
    final horizontalPadding = data.width *
        (data.isMobile ? 0.06 : data.isTablet ? 0.08 : 0.12);

    final steps = ConstData.steps;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: 80),
      child: Column(
        children: [
          const ProcessHeader(),
          const SizedBox(height: 60),
          Column(
            children: steps
                .asMap()
                .entries
                .map((entry) {
              final index = entry.key;
              final step = entry.value;
              final isLast = index == steps.length - 1;

              return ProcessStepCard(
                step: step,
                isLast: isLast,
                isMobile: data.isMobile,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

}