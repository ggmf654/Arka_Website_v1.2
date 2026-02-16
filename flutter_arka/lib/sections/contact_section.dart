// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 80,
      ),
      child: isMobile || isTablet
          ? Column(
              children: [
                _buildContactInfo(isMobile),
                const SizedBox(height: 48),
                _buildContactForm(isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContactInfo(isMobile)),
                const SizedBox(width: 64),
                Expanded(child: _buildContactForm(isMobile)),
              ],
            ),
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
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
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
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
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 40),
        
        // Contact Info Items
        _buildContactItem(
          icon: Icons.email_outlined,
          title: 'Email',
          value: 'arkaswft@gmail.com',
        ),
        const SizedBox(height: 20),
        _buildContactItem(
          icon: Icons.phone_outlined,
          title: 'Phone',
          value: '+963 997265638',
        ),
        const SizedBox(height: 20),
        _buildContactItem(
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: 'Damascus, Syria',
        ),
        
        const SizedBox(height: 40),
        
        // Social Links
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _socialButton(Icons.language, 'Website'),
            const SizedBox(width: 12),
            _socialButton(Icons.linked_camera, 'LinkedIn'),
            const SizedBox(width: 12),
            _socialButton(Icons.code, 'GitHub'),
          ],
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppTheme.cardDark,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.borderColor),
          ),
          child: Icon(icon, color: AppTheme.primaryGreen, size: 22),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon, String label) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppTheme.textSecondary, size: 20),
        onPressed: () {},
        tooltip: label,
      ),
    );
  }

  Widget _buildContactForm(bool isMobile) {
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
            
            // Name Field
            _buildTextField(
              controller: _nameController,
              label: 'Your Name',
              hint: 'John Doe',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            
            // Email Field
            _buildTextField(
              controller: _emailController,
              label: 'Email Address',
              hint: 'john@company.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            
            // Company Field
            _buildTextField(
              controller: _companyController,
              label: 'Company (Optional)',
              hint: 'Your Company Name',
            ),
            const SizedBox(height: 20),
            
            // Service Dropdown
            _buildDropdown(),
            const SizedBox(height: 20),
            
            // Budget Dropdown
            _buildBudgetDropdown(),
            const SizedBox(height: 20),
            
            // Message Field
            _buildTextField(
              controller: _messageController,
              label: 'Project Details',
              hint: 'Tell us about your project...',
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please describe your project';
                }
                return null;
              },
            ),
            const SizedBox(height: 28),
            
            // Submit Button
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
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.backgroundDark,
                          ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
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
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Service Interested In',
          style: TextStyle(
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
              value: _selectedService,
              isExpanded: true,
              dropdownColor: AppTheme.cardLighter,
              style: const TextStyle(color: AppTheme.textPrimary),
              icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.textMuted),
              items: services.map((service) {
                return DropdownMenuItem(
                  value: service,
                  child: Text(service),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedService = value!);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Budget Range (USD)',
          style: TextStyle(
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
              value: _selectedBudget,
              isExpanded: true,
              dropdownColor: AppTheme.cardLighter,
              style: const TextStyle(color: AppTheme.textPrimary),
              icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.textMuted),
              items: budgets.map((budget) {
                return DropdownMenuItem(
                  value: budget,
                  child: Text(budget),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedBudget = value!);
              },
            ),
          ),
        ),
      ],
    );
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() => _isSubmitting = false);
      
      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Message sent successfully! We\'ll be in touch soon.'),
            backgroundColor: AppTheme.primaryGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
        
        // Clear form
        _nameController.clear();
        _emailController.clear();
        _companyController.clear();
        _messageController.clear();
      }
    }
  }
}
