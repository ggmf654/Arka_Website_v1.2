import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class ResponsiveData {
  final double width;
  final double height;
  final DeviceType device;

  const ResponsiveData({
    required this.width,
    required this.height,
    required this.device,
  });

  bool get isMobile => device == DeviceType.mobile;
  bool get isTablet => device == DeviceType.tablet;
  bool get isDesktop => device == DeviceType.desktop;
}

class ResponsiveScope extends InheritedWidget {
  final ResponsiveData data;

  const ResponsiveScope({
    super.key,
    required this.data,
    required super.child,
  });

  static ResponsiveData of(BuildContext context) {
    final scope =
    context.dependOnInheritedWidgetOfExactType<ResponsiveScope>();
    return scope!.data;
  }

  @override
  bool updateShouldNotify(ResponsiveScope oldWidget) =>
      data != oldWidget.data;
}
