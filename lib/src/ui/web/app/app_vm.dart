import 'dart:async';

import 'package:b2b_client_lk/src/features/common/shared_pref/shared_pref.dart';
import 'package:b2b_client_lk/src/ui/web/common/responsive/device_sizes.dart';
import 'package:b2b_client_lk/src/ui/web/common/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppVM extends ChangeNotifier {
  final MainTheme _mainTheme;
  final SharedPref _sharedPref;

  ThemeData? _mobileThemeData;
  ThemeData? _tabletThemeData;

  AppVM(
    this._mainTheme,
    this._sharedPref,
  );

  Future<void> init() async {
    await _sharedPref.init();
    initTheme();
  }

  void initTheme() {
    const themeBrightness = Brightness.light;

    _mobileThemeData = _mainTheme.mobileThemeData(themeBrightness);
    _tabletThemeData = _mainTheme.tabletThemeData(themeBrightness);
  }

  ThemeData? setTheme(BuildContext context) {
    if (kIsWeb) {
      return DeviceSizes.isMobileSize(context) ? _mobileThemeData : _tabletThemeData;
    } else {
      return _mobileThemeData;
    }
  }
}
