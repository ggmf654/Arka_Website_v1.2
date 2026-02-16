// ignore_for_file: deprecated_member_use, unnecessary_const

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    final steps = [
      ProcessStep(
        number: '01',
        title: 'Discovery',
        description: 'We dive deep into understanding your business, goals, target audience, and technical requirements through collaborative workshops and research.',
        icon: Icons.search,
      ),
      ProcessStep(
        number: '02',
        title: 'Planning',
        description: 'Our team creates detailed project roadmaps, wireframes, and technical specifications to ensure alignment and set clear expectations.',
        icon: Icons.architecture,
      ),
      ProcessStep(
        number: '03',
        title: 'Design',
        description: 'We craft intuitive user interfaces and engaging experiences, iterating based on feedback to achieve the perfect balance of form and function.',
        icon: Icons.palette,
      ),
      ProcessStep(
        number: '04',
        title: 'Development',
        description: 'Our developers bring designs to life using agile methodologies, with regular demos and transparent communication throughout.',
        icon: Icons.code,
      ),
      ProcessStep(
        number: '05',
        title: 'Testing',
        description: 'Rigorous quality assurance including automated testing, security audits, and performance optimization ensures a flawless product.',
        icon: Icons.bug_report,
      ),
      ProcessStep(
        number: '06',
        title: 'Launch & Support',
        description: 'We handle deployment, monitoring, and provide ongoing maintenance and support to ensure your solution continues to perform.',
        icon: Icons.rocket_launch,
      ),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 80,
      ),
      child: Column(
        children: [
          // Section Header
          _buildSectionHeader(),
          
          const SizedBox(height: 60),
          
          // Process Steps
          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: steps.asMap().entries.map((entry) {
                  final index = entry.key;
                  final step = entry.value;
                  final isLast = index == steps.length - 1;
                  
                  return _ProcessStepCard(
                    step: step,
                    isLast: isLast,
                    isMobile: isMobile,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'OUR PROCESS',
            style: TextStyle(
              color: AppTheme.primaryGreen,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'How We Work',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: const Text(
            'A proven methodology that ensures successful project delivery while keeping you informed every step of the way.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

class ProcessStep {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  ProcessStep({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });
}

class _ProcessStepCard extends StatefulWidget {
  final ProcessStep step;
  final bool isLast;
  final bool isMobile;

  const _ProcessStepCard({
    required this.step,
    required this.isLast,
    required this.isMobile,
  });

  @override
  State<_ProcessStepCard> createState() => _ProcessStepCardState();
}

class _ProcessStepCardState extends State<_ProcessStepCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: widget.isMobile ? _buildMobileCard() : _buildDesktopCard(),
    );
  }

  Widget _buildMobileCard() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline
            Column(
              children: [
                _buildStepNumber(),
                if (!widget.isLast)
                  Container(
                    width: 2,
                    height: 100,
                    color: AppTheme.borderColor,
                  ),
              ],
            ),
            const SizedBox(width: 20),
            // Content
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
        if (!widget.isLast) const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDesktopCard() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left side - Number and Line
          SizedBox(
            width: 80,
            child: Column(
              children: [
                _buildStepNumber(),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppTheme.borderColor,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // Right side - Content
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: _isHovered ? AppTheme.cardLighter : AppTheme.cardDark,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isHovered 
                      ? AppTheme.primaryGreen.withOpacity(0.3) 
                      : AppTheme.borderColor,
                ),
              ),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepNumber() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: _isHovered ? AppTheme.primaryGreen : AppTheme.cardDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isHovered ? AppTheme.primaryGreen : AppTheme.borderColor,
        ),
      ),
      child: Center(
        child: Text(
          widget.step.number,
          style: TextStyle(
            color: _isHovered ? AppTheme.backgroundDark : AppTheme.primaryGreen,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              widget.step.icon,
              color: AppTheme.primaryGreen,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              widget.step.title,
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
          widget.step.description,
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
