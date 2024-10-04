import '../main.dart';

extension RoutesPath on Routes {
  String get path {
    //if (this == Routes.login) return "/";
    return "/${this.toString().toLowerCase().split(".")[1]}";
  }
}

extension fileSize on int {
  double get toMB {
    final kb = this / 1024;
    return kb / 1024;
  }
}
