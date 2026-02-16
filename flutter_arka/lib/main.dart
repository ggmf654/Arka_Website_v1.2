import 'package:flutter/material.dart';
import 'constants/app_info.dart';
import 'constants/break_points.dart';
import 'constants/responsive_scope.dart';
import 'theme/app_theme.dart';
import 'pages/home_page/home_page.dart';

void main() {
  final appInfo = AppInfo();
  appInfo.init(
    appName: 'ARKA - Software Development',
    version: '1.0.0',
  );

  runApp(const ArkaApp());
}

class ArkaApp extends StatelessWidget {
  const ArkaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final info = AppInfo();

    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine device type based on width
        final data = ResponsiveData(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          device: Breakpoints.fromWidth(constraints.maxWidth),
        );

        return ResponsiveScope(
          data: data,
          child: MaterialApp(
            title: info.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
