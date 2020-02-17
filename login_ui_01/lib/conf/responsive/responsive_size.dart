import 'package:login_ui/conf/appstore/app_store.dart';

class ResponsiveSize {
  double baseHeight = 800;
  double baseWidth = 480;

  BuildContext context;
  double height;
  double width;

  ResponsiveSize(BuildContext context) {
    this.context = context;
    this.height = MediaQuery.of(context).size.height;
    this.width = MediaQuery.of(context).size.width;
  }

  double setByHeight(double size) {
    return size * height / baseHeight;
  }

  double setByWidth(double size) {
    return size * width / baseWidth;
  }
}