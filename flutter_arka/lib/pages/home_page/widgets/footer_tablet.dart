import 'package:arka_website/pages/home_page/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import 'link_column.dart';

class FooterTablet extends StatelessWidget {
  const FooterTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Logo(),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: const Text(
            'Building innovative software solutions that help businesses grow and succeed in the digital age.',
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: LinkColumn(
                title: 'Services',
                links: [
                  'Mobile Development',
                  'Web Development',
                  'Desktop Apps',
                  'UI/UX Design',
                ],
              ),
            ),
            Expanded(
              child: LinkColumn(
                title: 'Company',
                links: [
                  'About Us',
                  'Portfolio',
                  'Process',
                  'Careers',
                ],
              ),
            ),
            Expanded(
              child: LinkColumn(
                title: 'Contact',
                links: [
                  'arkaswft.dam@gmail.com',
                  '+963 997265638',
                  'Damascus, Syria',
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
