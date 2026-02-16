class AppInfo {
  static final AppInfo _instance = AppInfo._internal();

  factory AppInfo() => _instance;

  AppInfo._internal();

  late String appName;
  late String version;
  late DateTime startTime;

  void init({
    required String appName,
    required String version,
  }) {
    this.appName = appName;
    this.version = version;
    startTime = DateTime.now();
  }
}
