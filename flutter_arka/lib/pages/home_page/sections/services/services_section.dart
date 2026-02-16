// ignore_for_file: deprecated_member_use, unnecessary_const

import '../../../../constants/const_data.dart';
import 'service_card.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import '../../../../constants/responsive_scope.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveScope.of(context);
    final isMobile = responsive.isMobile;
    final isTablet = responsive.isTablet;

    final services = ConstData.services;

    int crossAxisCount = isMobile ? 1 : isTablet ? 2 : 3;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 80,
      ),
      color: AppTheme.cardDark,
      child: Column(
        children: [
          _buildSectionHeader(),
          const SizedBox(height: 60),

          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: services.map((service) {
                  double cardWidth = isMobile
                      ? constraints.maxWidth
                      : (constraints.maxWidth - (crossAxisCount - 1) * 24) / crossAxisCount;
                  return SizedBox(
                    width: cardWidth,
                    child: ServiceCard(service: service),
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
            'SERVICES',
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
          'What We Do Best',
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
            'Comprehensive software solutions tailored to your business needs, built with modern technologies and best practices.',
            textAlign: TextAlign.center,
            style: TextStyle(
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

