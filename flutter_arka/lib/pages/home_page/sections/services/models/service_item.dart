
import 'package:flutter/cupertino.dart';

class ServiceItem {
  final IconData icon;
  final String title;
  final String description;
  final List<String> technologies;

  ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.technologies,
  });
}