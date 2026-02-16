
import 'package:flutter/cupertino.dart';

class ProcessStep {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  ProcessStep({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });
}