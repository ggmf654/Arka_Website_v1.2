import 'process_desktop_card.dart';
import 'process_mobile_card.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'models/process_step.dart';

class ProcessStepCard extends StatefulWidget {
  final ProcessStep step;
  final bool isLast;
  final bool isMobile;

  const ProcessStepCard({super.key,
    required this.step,
    required this.isLast,
    required this.isMobile,
  });

  @override
  State<ProcessStepCard> createState() => _ProcessStepCardState();
}

class _ProcessStepCardState extends State<ProcessStepCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.step.number),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          setState(() => _isHovered = true);
        } else if (info.visibleFraction < 0.5 && _isHovered) {
          setState(() => _isHovered = false);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        transform: _isHovered
            ? Matrix4.translationValues(0, -4, 0)
            : Matrix4.identity(),

        child: Opacity(
          opacity: _isHovered ? 1 : 0.85,
          child: widget.isMobile
              ? ProcessMobileCard(isLast: widget.isLast, isHovered: _isHovered, step: widget.step,)
              : ProcessDesktopCard(isLast: widget.isLast, isHovered: _isHovered, step: widget.step,),
        ),
      ),
    );
  }


}


