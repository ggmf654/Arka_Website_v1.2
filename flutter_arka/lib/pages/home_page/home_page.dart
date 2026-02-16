import 'sections/contact/contact_section.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'widgets/navigation_bar.dart';
import 'widgets/footer.dart';
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

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _processKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;

    switch (section) {
      case 'home':
        targetKey = _homeKey;
        break;
      case 'services':
        targetKey = _servicesKey;
        break;
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'portfolio':
        targetKey = _portfolioKey;
        break;
      case 'process':
        targetKey = _processKey;
        break;
      case 'contact':
        targetKey = _contactKey;
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
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Container(
                  key: _homeKey,
                  child: HeroSection(
                    onGetStarted: () => _scrollToSection('contact'),
                    onViewWork: () => _scrollToSection('portfolio'),
                  ),
                ),
                Container(
                  key: _servicesKey,
                  child: const ServicesSection(),
                ),
                Container(
                  key: _aboutKey,
                  child: const AboutSection(),
                ),
                Container(
                  key: _portfolioKey,
                  child: const PortfolioSection(),
                ),
                Container(
                  key: _processKey,
                  child: const ProcessSection(),
                ),
                const TestimonialsSection(),
                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
                const ArkaFooter(),
              ],
            ),
          ),
          Positioned(
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
