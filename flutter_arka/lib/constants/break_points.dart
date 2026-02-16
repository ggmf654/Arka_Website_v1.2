import 'responsive_scope.dart';

class Breakpoints {
  static const double mobile = 768;
  static const double tablet = 1100;

  static DeviceType fromWidth(double width) {
    if (width < mobile) return DeviceType.mobile;
    if (width < tablet) return DeviceType.tablet;
    return DeviceType.desktop;
  }
}
