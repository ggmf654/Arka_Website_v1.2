import 'package:flutter/material.dart';

class CtaButtons extends StatelessWidget {
  final Function() onViewWork;
  final Function() onGetStarted;
  const CtaButtons({super.key, required this.onViewWork, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onGetStarted,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Start Your Project'),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: onViewWork,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          ),
          child: const Text('View Our Work'),
        ),
      ],
    );
  }
}
