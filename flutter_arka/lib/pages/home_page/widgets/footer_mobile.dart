import 'package:arka_website/pages/home_page/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import 'link_column.dart';
class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
      Logo(),
        SizedBox(height: 16),
        Text(
          'Building innovative software solutions that help businesses grow and succeed in the digital age.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14,
            height: 1.6,
          ),
        ),
        SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: LinkColumn(
                title: 'Services',
                links: [
                  'Mobile Development',
                  'Web Development',
                  'Desktop Apps',
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: LinkColumn(
                title: 'Company',
                links: [
                  'About Us',
                  'Portfolio',
                  'Contact',
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: LinkColumn(
                title: 'Contact',
                links: [
                  'arkaswft@gmail.com',
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
