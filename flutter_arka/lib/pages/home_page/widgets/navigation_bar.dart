import 'package:arka_website/pages/home_page/widgets/logo.dart';
import 'package:flutter/material.dart';
import '../../../constants/responsive_scope.dart';
import '../../../theme/app_theme.dart';
import '../../dashbord_page/dashboard_page.dart';

class ArkaNavigationBar extends StatefulWidget {
  final Function(String) onNavigate;

  const ArkaNavigationBar({super.key, required this.onNavigate});

  static Drawer buildDrawer(BuildContext context, Function(String) onNavigate) {
    final data = ResponsiveScope.of(context);

    return Drawer(
      backgroundColor: AppTheme.cardDark,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(data.width * 0.06),
          child: Column(
            children: [
              _drawerItem(context, 'Home', 'home', onNavigate),
              _drawerItem(context, 'Services', 'services', onNavigate),
              _drawerItem(context, 'About', 'about', onNavigate),
              _drawerItem(context, 'Portfolio', 'portfolio', onNavigate),
              _drawerItem(context, 'Process', 'process', onNavigate),
              _drawerItem(context, 'Dashboard', 'dashboard', onNavigate),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onNavigate('contact');
                  },
                  child: const Text('Get in Touch'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _drawerItem(BuildContext context, String text, String section,
      Function(String) onNavigate) {
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
            MaterialPageRoute(builder: (_) => const DashboardPage()),
          );
        } else {
          onNavigate(section);
        }
      },
    );
  }

  @override
  State<ArkaNavigationBar> createState() => _ArkaNavigationBarState();
}

class _ArkaNavigationBarState extends State<ArkaNavigationBar> {
  final bool _isScrolled = false;

  @override
  Widget build(BuildContext context) {
    final data = ResponsiveScope.of(context);
    final horizontalPadding = data.width *
        (data.isMobile
            ? 0.04
            : data.isTablet
            ? 0.05
            : 0.06);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: data.isMobile ? 12 : 16,
      ),
      decoration: BoxDecoration(
        color: AppTheme.backgroundDark.withOpacity(0.75),
        border: Border(
          bottom: BorderSide(
            color: _isScrolled ? AppTheme.borderColor : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: data.isMobile
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Logo(),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      )
          : data.isTablet
          ? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Logo(),
          const SizedBox(height: 16),
          _buildDesktopNav(data, isCentered: true),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         const Logo(),
          _buildDesktopNav(data, isCentered: false),
        ],
      ),
    );
  }


  Widget _buildDesktopNav(ResponsiveData data, {required bool isCentered}) {
    final fontSize = data.isTablet ? 13.0 : 14.0;
    final spacing = data.isTablet ? 12.0 : 18.0;

    final navItems = [
      _navLink('Home', 'home', fontSize),
      _navLink('Services', 'services', fontSize),
      _navLink('About', 'about', fontSize),
      _navLink('Portfolio', 'portfolio', fontSize),
      _navLink('Process', 'process', fontSize),
      _navLink('Dashboard', 'dashboard', fontSize),
      ElevatedButton(
        onPressed: () => widget.onNavigate('contact'),
        child: const Text('Get in Touch'),
      ),
    ];

    return isCentered
        ? Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: spacing,
          runSpacing: 8,
          children: navItems,
        ),
      ],
    )
        : Row(
      children: navItems
          .map((item) => Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing / 2),
        child: item,
      ))
          .toList(),
    );
  }

  Widget _navLink(String text, String section, double fontSize) {
    return TextButton(
      onPressed: () {
        if (section == 'dashboard') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const DashboardPage()),
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
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
      ),
    );
  }
}
