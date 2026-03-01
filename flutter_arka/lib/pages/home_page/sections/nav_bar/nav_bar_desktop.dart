import 'nav_link.dart';
import 'package:flutter/material.dart';
import '../../../../constants/responsive_scope.dart';

class NavBarDesktop extends StatelessWidget {
  final bool isCentered;
  final Function(String) onNavigate;

  const NavBarDesktop(
      {super.key, required this.isCentered, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final data = ResponsiveScope.of(context);
    final fontSize = data.isTablet ? 13.0 : 14.0;
    final spacing = data.isTablet ? 12.0 : 18.0;

    final navItems = [
      NavLink(text: 'Home', section: 'home', fontSize: fontSize,onNavigate: onNavigate,),
      NavLink(text: 'Services', section: 'services', fontSize: fontSize,onNavigate: onNavigate),
      NavLink(text: 'About', section: 'about', fontSize: fontSize,onNavigate: onNavigate),
      NavLink(text: 'Portfolio', section: 'portfolio', fontSize: fontSize,onNavigate: onNavigate),
      NavLink(text: 'Process', section: 'process', fontSize: fontSize,onNavigate: onNavigate),
      NavLink(text: 'Our Team', section: 'ourTeam', fontSize: fontSize,onNavigate: onNavigate),
      NavLink(text: 'Testimonials', section: 'testimonials', fontSize: fontSize,onNavigate: onNavigate),
      NavLink(text: 'Dashboard', section: 'dashboard', fontSize: fontSize,onNavigate: onNavigate),
      ElevatedButton(
        onPressed: () => onNavigate('contact'),
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
}
