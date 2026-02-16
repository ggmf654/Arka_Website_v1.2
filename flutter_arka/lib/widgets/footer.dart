// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ArkaFooter extends StatelessWidget {
  const ArkaFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 48,
      ),
      color: AppTheme.cardDark,
      child: Column(
        children: [
          // Main Footer Content
          isMobile ? _buildMobileFooter() : _buildDesktopFooter(),
          
          const SizedBox(height: 40),
          
          // Divider
          Container(
            height: 1,
            color: AppTheme.borderColor,
          ),
          
          const SizedBox(height: 24),
          
          // Bottom Row
          isMobile
              ? Column(
                  children: [
                    _buildCopyright(),
                    const SizedBox(height: 16),
                    _buildLegalLinks(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCopyright(),
                    _buildLegalLinks(),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo and Description
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogo(),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Text(
                  'Building innovative software solutions that help businesses grow and succeed in the digital age.',
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // Services Links
        Expanded(
          child: _buildLinkColumn(
            title: 'Services',
            links: [
              'Mobile Development',
              'Web Development',
              'Desktop Apps',
              'UI/UX Design',
            ],
          ),
        ),
        
        // Company Links
        Expanded(
          child: _buildLinkColumn(
            title: 'Company',
            links: [
              'About Us',
              'Portfolio',
              'Process',
              'Careers',
            ],
          ),
        ),
        
        // Contact Links
        Expanded(
          child: _buildLinkColumn(
            title: 'Contact',
            links: [
              'arkaswft@gmail.com',
              '+963 997265638',
              'Damascus, Syria',
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      children: [
        _buildLogo(),
        const SizedBox(height: 16),
        const Text(
          'Building innovative software solutions that help businesses grow and succeed in the digital age.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildLinkColumn(
                title: 'Services',
                links: [
                  'Mobile Development',
                  'Web Development',
                  'Desktop Apps',
                ],
              ),
            ),
            Expanded(
              child: _buildLinkColumn(
                title: 'Company',
                links: [
                  'About Us',
                  'Portfolio',
                  'Contact',
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Text(
              'A',
              style: TextStyle(
                color: AppTheme.backgroundDark,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'ARKA',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildLinkColumn({
    required String title,
    required List<String> links,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            link,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildCopyright() {
    return Text(
      '© ${DateTime.now().year} ARKA. All rights reserved.',
      style: const TextStyle(
        color: AppTheme.textMuted,
        fontSize: 13,
      ),
    );
  }

  Widget _buildLegalLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Privacy Policy',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(width: 16),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Terms of Service',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
