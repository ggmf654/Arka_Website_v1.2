import 'package:arka_website/pages/home_page/sections/nav_bar/drawer_item.dart';
import 'package:arka_website/pages/home_page/widgets/logo.dart';
import 'package:arka_website/pages/home_page/sections/nav_bar/nav_bar_desktop.dart';
import 'package:flutter/material.dart';
import '../../../../constants/responsive_scope.dart';
import '../../../../theme/app_theme.dart';
import '../../../dashbord_page/dashboard_page.dart';

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
              DrawerItem(text: 'Home', section: 'home', onNavigate: onNavigate),
              DrawerItem(
                  text: 'Services',
                  section: 'services',
                  onNavigate: onNavigate),
              DrawerItem(
                  text: 'About', section: 'about', onNavigate: onNavigate),
              DrawerItem(
                  text: 'Portfolio',
                  section: 'portfolio',
                  onNavigate: onNavigate),
              DrawerItem(
                  text: 'Process', section: 'process', onNavigate: onNavigate),
              DrawerItem(
                  text: 'Our Team',
                  section: 'ourTeam',
                  onNavigate: onNavigate),
              DrawerItem(
                  text: 'Testimonials',
                  section: 'testimonials',
                  onNavigate: onNavigate),
              DrawerItem(
                  text: 'Dashboard',
                  section: 'dashboard',
                  onNavigate: onNavigate),
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
            builder: (context) =>
                IconButton(
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
          NavBarDesktop(onNavigate:widget.onNavigate,isCentered: true),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Logo(),
          NavBarDesktop(onNavigate:widget.onNavigate,isCentered: false),
        ],
      ),
    );
  }

}
