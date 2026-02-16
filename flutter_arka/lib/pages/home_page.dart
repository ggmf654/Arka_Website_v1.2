import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/footer.dart';
import '../sections/hero_section.dart';
import '../sections/services_section.dart';
import '../sections/about_section.dart';
import '../sections/portfolio_section.dart';
import '../sections/process_section.dart';
import '../sections/testimonials_section.dart';
import '../sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  
  // Section Keys for scrolling
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
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Spacer for fixed nav
                const SizedBox(height: 80),
                
                // Hero Section
                Container(
                  key: _homeKey,
                  child: HeroSection(
                    onGetStarted: () => _scrollToSection('contact'),
                    onViewWork: () => _scrollToSection('portfolio'),
                  ),
                ),
                
                // Services Section
                Container(
                  key: _servicesKey,
                  child: const ServicesSection(),
                ),
                
                // About Section
                Container(
                  key: _aboutKey,
                  child: const AboutSection(),
                ),
                
                // Portfolio Section
                Container(
                  key: _portfolioKey,
                  child: const PortfolioSection(),
                ),
                
                // Process Section
                Container(
                  key: _processKey,
                  child: const ProcessSection(),
                ),
                
                // Testimonials Section
                const TestimonialsSection(),
                
                // Contact Section
                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
                
                // Footer
                const ArkaFooter(),
              ],
            ),
          ),
          
          // Fixed Navigation Bar
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
