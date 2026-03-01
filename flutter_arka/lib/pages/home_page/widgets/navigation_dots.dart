import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class NavigationDots extends StatelessWidget {
  final int currentIndex;
  final List items;
  final Function(int) onChanged;

  const NavigationDots({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: currentIndex > 0
              ? () => onChanged(currentIndex - 1)
              : null,
          icon: Icon(
            Icons.arrow_back,
            color: currentIndex > 0
                ? AppTheme.textPrimary
                : AppTheme.textMuted,
          ),
        ),
        const SizedBox(width: 16),
        ...List.generate(items.length, (index) {
          return GestureDetector(
            onTap: () => onChanged(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: currentIndex == index ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? AppTheme.primaryGreen
                    : AppTheme.borderColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        }),
        const SizedBox(width: 16),
        IconButton(
          onPressed: currentIndex < items.length - 1
              ? () => onChanged(currentIndex + 1)
              : null,
          icon: Icon(
            Icons.arrow_forward,
            color: currentIndex < items.length - 1
                ? AppTheme.textPrimary
                : AppTheme.textMuted,
          ),
        ),
      ],
    );
  }
}
