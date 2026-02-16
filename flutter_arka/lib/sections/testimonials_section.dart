// ignore_for_file: deprecated_member_use, unnecessary_const

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int _currentIndex = 0;

  final testimonials = [
    Testimonial(
      quote: 'ARKA transformed our business operations with a custom ERP system that exceeded all expectations. Their team was professional, responsive, and truly understood our needs.',
      author: 'Sarah Mitchell',
      role: 'CEO, RetailMax Solutions',
      company: 'RetailMax Solutions',
    ),
    Testimonial(
      quote: 'The mobile app ARKA built for our healthcare platform has received outstanding feedback from our users. Their attention to detail and user experience expertise is remarkable.',
      author: 'Dr. James Chen',
      role: 'Founder, HealthTrack',
      company: 'HealthTrack',
    ),
    Testimonial(
      quote: 'Working with ARKA felt like having an extended team. They were transparent, delivered on time, and the quality of their work speaks for itself.',
      author: 'Maria Rodriguez',
      role: 'CTO, EduLearn Inc.',
      company: 'EduLearn Inc.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 80,
      ),
      color: AppTheme.cardDark,
      child: Column(
        children: [
          // Section Header
          _buildSectionHeader(),
          
          const SizedBox(height: 60),
          
          // Testimonial Card
          _buildTestimonialCard(isMobile),
          
          const SizedBox(height: 32),
          
          // Navigation Dots
          _buildNavigationDots(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'TESTIMONIALS',
            style: TextStyle(
              color: AppTheme.primaryGreen,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'What Our Clients Say',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: const Text(
            'Don\'t just take our word for it. Here\'s what our partners have to say about working with us.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTestimonialCard(bool isMobile) {
    final testimonial = testimonials[_currentIndex];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(_currentIndex),
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 800),
        padding: EdgeInsets.all(isMobile ? 24 : 40),
        decoration: BoxDecoration(
          color: AppTheme.backgroundDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderColor),
        ),
        child: Column(
          children: [
            // Quote Icon
            Icon(
              Icons.format_quote,
              color: AppTheme.primaryGreen.withOpacity(0.3),
              size: 48,
            ),
            
            const SizedBox(height: 24),
            
            // Quote Text
            Text(
              testimonial.quote,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: isMobile ? 16 : 20,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                height: 1.7,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Divider
            Container(
              width: 60,
              height: 2,
              color: AppTheme.primaryGreen,
            ),
            
            const SizedBox(height: 24),
            
            // Author Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Text(
                      testimonial.author.substring(0, 1),
                      style: const TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial.author,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      testimonial.role,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous Button
        IconButton(
          onPressed: _currentIndex > 0
              ? () => setState(() => _currentIndex--)
              : null,
          icon: Icon(
            Icons.arrow_back,
            color: _currentIndex > 0
                ? AppTheme.textPrimary
                : AppTheme.textMuted,
          ),
        ),
        
        const SizedBox(width: 16),
        
        // Dots
        ...List.generate(testimonials.length, (index) {
          return GestureDetector(
            onTap: () => setState(() => _currentIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _currentIndex == index ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? AppTheme.primaryGreen
                    : AppTheme.borderColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        }),
        
        const SizedBox(width: 16),
        
        // Next Button
        IconButton(
          onPressed: _currentIndex < testimonials.length - 1
              ? () => setState(() => _currentIndex++)
              : null,
          icon: Icon(
            Icons.arrow_forward,
            color: _currentIndex < testimonials.length - 1
                ? AppTheme.textPrimary
                : AppTheme.textMuted,
          ),
        ),
      ],
    );
  }
}

class Testimonial {
  final String quote;
  final String author;
  final String role;
  final String company;

  Testimonial({
    required this.quote,
    required this.author,
    required this.role,
    required this.company,
  });
}
