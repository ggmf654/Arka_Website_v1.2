// ignore_for_file: deprecated_member_use, prefer_final_fields

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../pages/dashboard_page.dart';

class ArkaNavigationBar extends StatefulWidget {
  final Function(String) onNavigate;
  
  const ArkaNavigationBar({super.key, required this.onNavigate});

  @override
  State<ArkaNavigationBar> createState() => _ArkaNavigationBarState();
}

class _ArkaNavigationBarState extends State<ArkaNavigationBar> {
  bool _isScrolled = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: _isScrolled 
            ? AppTheme.backgroundDark.withOpacity(0.95) 
            : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: _isScrolled ? AppTheme.borderColor : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          _buildLogo(),
          
          // Navigation Links (Desktop) or Menu Button (Mobile)
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
              onPressed: () => _showMobileMenu(context),
            )
          else
            _buildDesktopNav(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'A',
              style: TextStyle(
                color: AppTheme.backgroundDark,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'ARKA',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopNav() {
    return Row(
      children: [
        _navLink('Home', 'home'),
        _navLink('Services', 'services'),
        _navLink('About', 'about'),
        _navLink('Portfolio', 'portfolio'),
        _navLink('Process', 'process'),
        _navLink('Dashboard', 'dashboard'),
        const SizedBox(width: 24),
        ElevatedButton(
          onPressed: () => widget.onNavigate('contact'),
          child: const Text('Get in Touch'),
        ),
      ],
    );
  }

  Widget _navLink(String text, String section) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {
          if (section == 'dashboard') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const DashboardPage(),
              ),
            );
          } else {
            widget.onNavigate(section);
          }
        },
        style: TextButton.styleFrom(
          foregroundColor: AppTheme.textSecondary,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.cardDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _mobileNavItem('Home', 'home', context),
            _mobileNavItem('Services', 'services', context),
            _mobileNavItem('About', 'about', context),
            _mobileNavItem('Portfolio', 'portfolio', context),
            _mobileNavItem('Process', 'process', context),
            _mobileNavItem('Dashboard', 'dashboard', context),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onNavigate('contact');
                },
                child: const Text('Get in Touch'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mobileNavItem(String text, String section, BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        if (section == 'dashboard') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const DashboardPage(),
            ),
          );
        } else {
          widget.onNavigate(section);
        }
      },
    );
  }
}
