import 'dart:ui';

class ProjectItem {
  final String title;
  final String category;
  final String description;
  final List<String> technologies;
  final Color color;

  ProjectItem({
    required this.title,
    required this.category,
    required this.description,
    required this.technologies,
    required this.color,
  });
}
