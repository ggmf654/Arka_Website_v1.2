import 'sections/our_team/our_team_section.dart';
import 'sections/contact/contact_section.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'sections/nav_bar/navigation_bar.dart';
import 'sections/footer/footer.dart';
import 'sections/hero/hero_section.dart';
import 'sections/services/services_section.dart';
import 'sections/about/about_section.dart';
import 'sections/portfolio/portfolio_section.dart';
import 'sections/process/process_section.dart';
import 'sections/testimonials/testimonials_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  static GlobalKey homeKey = GlobalKey();
  static GlobalKey servicesKey = GlobalKey();
  static GlobalKey aboutKey = GlobalKey();
  static GlobalKey testimonialsKey = GlobalKey();
  static GlobalKey portfolioKey = GlobalKey();
  static GlobalKey processKey = GlobalKey();
  static GlobalKey contactKey = GlobalKey();
  static GlobalKey ourTeamKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  static void _scrollToSection(String section) {
    GlobalKey? targetKey;

    switch (section) {
      case 'home':
        targetKey = homeKey;
        break;
      case 'services':
        targetKey = servicesKey;
        break;
      case 'about':
        targetKey = aboutKey;
        break;
      case 'portfolio':
        targetKey = portfolioKey;
        break;
      case 'process':
        targetKey = processKey;
        break;
      case 'contact':
        targetKey = contactKey;
        break;
      case 'ourTeam':
        targetKey = ourTeamKey;
        break;
      case 'testimonials':
        targetKey = testimonialsKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      drawer: ArkaNavigationBar.buildDrawer(context, _scrollToSection),
      body: Stack(
        children: [
          Scrollbar(
            thumbVisibility: true,
            interactive: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Container(
                    key: homeKey,
                    child: HeroSection(
                      onGetStarted: () => _scrollToSection('contact'),
                      onViewWork: () => _scrollToSection('portfolio'),
                    ),
                  ),
                  Container(
                    key: servicesKey,
                    child: const ServicesSection(),
                  ),
                  Container(
                    key: aboutKey,
                    child: const AboutSection(),
                  ),
                  Container(
                    key: portfolioKey,
                    child: const PortfolioSection(),
                  ),
                  Container(
                    key: processKey,
                    child: const ProcessSection(),
                  ),
                  Container(
                    key: ourTeamKey,
                    child: const OurTeamSection(),
                  ),
                  Container(
                    key: testimonialsKey,
                    child: const TestimonialsSection(),
                  ),
                  Container(
                    key: contactKey,
                    child: const ContactSection(),
                  ),
                  const ArkaFooter(),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ArkaNavigationBar(
              onNavigate: _scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
}
