import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';

class NavigationDots extends StatefulWidget {
  final int currentIndex;
  final List testimonials;

  const NavigationDots(
      {super.key, required this.currentIndex, required this.testimonials});

  @override
  State<NavigationDots> createState() => _NavigationDotsState();
}

class _NavigationDotsState extends State<NavigationDots> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed:
              _currentIndex > 0 ? () => setState(() => _currentIndex--) : null,
          icon: Icon(
            Icons.arrow_back,
            color:
                _currentIndex > 0 ? AppTheme.textPrimary : AppTheme.textMuted,
          ),
        ),
        const SizedBox(width: 16),
        ...List.generate(widget.testimonials.length, (index) {
          return GestureDetector(
            onTap: () => setState(() => _currentIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _currentIndex == index ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? AppTheme.primaryGreen
                    : AppTheme.borderColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        }),
        const SizedBox(width: 16),
        IconButton(
          onPressed: _currentIndex < widget.testimonials.length - 1
              ? () => setState(() => _currentIndex++)
              : null,
          icon: Icon(
            Icons.arrow_forward,
            color: _currentIndex < widget.testimonials.length - 1
                ? AppTheme.textPrimary
                : AppTheme.textMuted,
          ),
        ),
      ],
    );
  }
}
