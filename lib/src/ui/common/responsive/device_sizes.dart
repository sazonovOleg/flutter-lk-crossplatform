import 'package:flutter/cupertino.dart';

class DeviceSizes {
  static bool isMobileSize(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTabletSize(BuildContext context) {
    return MediaQuery.of(context).size.width < 1180;
  }

  static bool isDesktopSize(BuildContext context) {
    return MediaQuery.of(context).size.width < 1400;
  }
}
