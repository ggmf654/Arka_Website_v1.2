import 'contact_section_contact_item.dart';
import 'contact_section_social_button.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';

class ContactSectionContactInfo extends StatelessWidget {
  final bool center;

  const ContactSectionContactInfo({super.key, required this.center});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'CONTACT US',
            style: TextStyle(
              color: AppTheme.primaryGreen,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Let\'s Build Something Great Together',
          textAlign: center ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Have a project in mind? We\'d love to hear about it. Fill out the form and we\'ll get back to you within 24 hours.',
          textAlign: center ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 40),

        // Contact Items
        ContactSectionContactItem(
          center: center,
          icon: Icons.email_outlined,
          title: 'Email',
          value: 'arkasoft.dam@gmail.com',
        ),
        const SizedBox(height: 20),
        ContactSectionContactItem(
          center: center,
          icon: Icons.phone_outlined,
          title: 'Phone',
          value: '+963 997 265 638',
        ),
        const SizedBox(height: 20),
        ContactSectionContactItem(
          center: center,
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: 'Damascus, Syria',
        ),
        const SizedBox(height: 40),

        // Social Links
        Row(
          mainAxisAlignment:
              center ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: const [
            ContactSectionSocialButton(icon:Icons.language,label:  'Website'),
            SizedBox(width: 12),
            ContactSectionSocialButton(icon:Icons.linked_camera,label: 'LinkedIn'),
            SizedBox(width: 12),
            ContactSectionSocialButton(icon:Icons.code,label: 'GitHub'),
          ],
        ),
      ],
    );
  }
}
