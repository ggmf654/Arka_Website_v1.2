import 'package:flutter/material.dart';

import '../pages/home_page/sections/process/models/process_step.dart';
import '../pages/home_page/sections/services/models/service_item.dart';
import '../pages/home_page/sections/testimonials/models/testimonials.dart';

class  ConstData{
static List services= [
  ServiceItem(
    icon: Icons.phone_android,
    title: 'Mobile App Development',
    description: 'Native and cross-platform mobile applications built with Flutter and Dart for iOS and Android.',
    technologies: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
  ),
  ServiceItem(
    icon: Icons.language,
    title: 'Web Development',
    description: 'Modern, responsive web applications and platforms using cutting-edge technologies.',
    technologies: ['React', 'Next.js', 'Node.js', 'TypeScript'],
  ),
  ServiceItem(
    icon: Icons.desktop_windows,
    title: 'Desktop Applications',
    description: 'Powerful desktop software solutions for Windows, macOS, and Linux platforms.',
    technologies: ['.NET', 'C#', 'WPF', 'Electron'],
  ),
  ServiceItem(
    icon: Icons.brush,
    title: 'UI/UX Design',
    description: 'User-centered design that creates intuitive, beautiful, and engaging digital experiences.',
    technologies: ['Figma', 'Prototyping', 'User Research', 'Design Systems'],
  ),
  ServiceItem(
    icon: Icons.settings_suggest,
    title: 'System Automation',
    description: 'Streamline operations with custom automation solutions and workflow optimization.',
    technologies: ['Python', 'Power Automate', 'APIs', 'Scripting'],
  ),
  ServiceItem(
    icon: Icons.storage,
    title: 'Database Solutions',
    description: 'Robust database architecture and management for scalable, secure data handling.',
    technologies: ['SQL Server', 'PostgreSQL', 'MongoDB', 'Firebase'],
  ),
];
static List testimonials = [
  Testimonial(
    quote:
    'ARKA transformed our business operations with a custom ERP system that exceeded all expectations. Their team was professional, responsive, and truly understood our needs.',
    author: 'Sarah Mitchell',
    role: 'CEO, RetailMax Solutions',
    company: 'RetailMax Solutions',
  ),
  Testimonial(
    quote:
    'The mobile app ARKA built for our healthcare platform has received outstanding feedback from our users. Their attention to detail and user experience expertise is remarkable.',
    author: 'Dr. James Chen',
    role: 'Founder, HealthTrack',
    company: 'HealthTrack',
  ),
  Testimonial(
    quote:
    'Working with ARKA felt like having an extended team. They were transparent, delivered on time, and the quality of their work speaks for itself.',
    author: 'Maria Rodriguez',
    role: 'CTO, EduLearn Inc.',
    company: 'EduLearn Inc.',
  ),
];
  static List steps = [
  ProcessStep(
  number: '01',
  title: 'Discovery',
  description:
  'We dive deep into understanding your business, goals, target audience, and technical requirements through collaborative workshops and research.',
  icon: Icons.search,
  ),
  ProcessStep(
  number: '02',
  title: 'Planning',
  description:
  'Our team creates detailed project roadmaps, wireframes, and technical specifications to ensure alignment and set clear expectations.',
  icon: Icons.architecture,
  ),
  ProcessStep(
  number: '03',
  title: 'Design',
  description:
  'We craft intuitive user interfaces and engaging experiences, iterating based on feedback to achieve the perfect balance of form and function.',
  icon: Icons.palette,
  ),
  ProcessStep(
  number: '04',
  title: 'Development',
  description:
  'Our developers bring designs to life using agile methodologies, with regular demos and transparent communication throughout.',
  icon: Icons.code,
  ),
  ProcessStep(
  number: '05',
  title: 'Testing',
  description:
  'Rigorous quality assurance including automated testing, security audits, and performance optimization ensures a flawless product.',
  icon: Icons.bug_report,
  ),
  ProcessStep(
  number: '06',
  title: 'Launch & Support',
  description:
  'We handle deployment, monitoring, and provide ongoing maintenance and support to ensure your solution continues to perform.',
  icon: Icons.rocket_launch,
  ),
  ];
}