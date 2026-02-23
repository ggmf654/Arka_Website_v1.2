import 'package:arka_website/pages/home_page/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import 'link_column.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Logo(),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Text(
                  'Building innovative software solutions that help businesses grow and succeed in the digital age.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(
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
        const Expanded(
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
        const Expanded(
          child: LinkColumn(
            title: 'Contact',
            links: [
              'arkaswft.dam@gmail.com',
              '+963 997 265 638',
              'Damascus, Syria',
            ],
          ),
        ),
      ],
    );
  }
}
