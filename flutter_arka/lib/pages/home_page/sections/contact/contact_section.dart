// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'contact_section_contact_info.dart';
import 'package:flutter/material.dart';
import '../../../../constants/responsive_scope.dart';
import '../../../../theme/app_theme.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedService = 'Mobile App Development';
  String _selectedBudget = '100 - 500 USD';
  bool _isSubmitting = false;

  final services = [
    'Mobile App Development',
    'Web Development',
    'Desktop Applications',
    'UI/UX Design',
    'System Automation',
    'Database Solutions',
    'Other',
  ];

  final budgets = const [
    '100 - 500 USD',
    '500 - 1000 USD',
    '1000 - 3000 USD',
    '3000 - 6000 USD',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveScope.of(context);

    double horizontalPadding = responsive.isMobile ? 24 : 48;
    bool isMobile = responsive.isMobile;
    bool isTablet = responsive.isTablet;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 80,
      ),
      child: isMobile || isTablet
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactSectionContactInfo(center: true),
          const SizedBox(height: 48),
          _buildContactForm(),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ContactSectionContactInfo(center: false)),
          const SizedBox(width: 64),
          Expanded(child: _buildContactForm()),
        ],
      ),
    );
  }


  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send us a message',
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),

            // Name
            _buildTextField(_nameController, 'Your Name', 'John Doe', validator: (v) {
              if (v == null || v.isEmpty) return 'Please enter your name';
              return null;
            }),
            const SizedBox(height: 20),

            // Email
            _buildTextField(_emailController, 'Email Address', 'john@company.com',
                keyboardType: TextInputType.emailAddress, validator: (v) {
                  if (v == null || v.isEmpty) return 'Please enter your email';
                  if (!v.contains('@')) return 'Please enter a valid email';
                  return null;
                }),
            const SizedBox(height: 20),

            // Company
            _buildTextField(_companyController, 'Company (Optional)', 'Your Company Name'),
            const SizedBox(height: 20),

            // Service
            _buildDropdown('Service Interested In', services, _selectedService, (v) {
              setState(() => _selectedService = v!);
            }),
            const SizedBox(height: 20),

            // Budget
            _buildDropdown('Budget Range (USD)', budgets, _selectedBudget, (v) {
              setState(() => _selectedBudget = v!);
            }),
            const SizedBox(height: 20),

            // Message
            _buildTextField(_messageController, 'Project Details', 'Tell us about your project...',
                maxLines: 4, validator: (v) {
                  if (v == null || v.isEmpty) return 'Please describe your project';
                  return null;
                }),
            const SizedBox(height: 28),

            // Submit
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _handleSubmit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: _isSubmitting
                    ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppTheme.backgroundDark),
                  ),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Send Message'),
                    SizedBox(width: 8),
                    Icon(Icons.send, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String hint,
      {int maxLines = 1,
        TextInputType? keyboardType,
        String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(color: AppTheme.textPrimary),
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }

  Widget _buildDropdown(
      String label, List<String> items, String selected, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppTheme.cardDark,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.borderColor),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selected,
              isExpanded: true,
              dropdownColor: AppTheme.cardLighter,
              style: const TextStyle(color: AppTheme.textPrimary),
              icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.textMuted),
              items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      // simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() => _isSubmitting = false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Message sent successfully! We\'ll be in touch soon.'),
            backgroundColor: AppTheme.primaryGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        );

        // clear form
        _nameController.clear();
        _emailController.clear();
        _companyController.clear();
        _messageController.clear();
      }
    }
  }
}
