import 'dart:async';

import 'package:b2b_client_lk/src/features/common/shared_pref/shared_pref.dart';
import 'package:b2b_client_lk/src/ui/common/responsive/device_sizes.dart';
import 'package:b2b_client_lk/src/ui/common/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppVM extends ChangeNotifier {
  final MainTheme _mainTheme;
  final SharedPref _sharedPref;

  AppVM(
    this._mainTheme,
    this._sharedPref,
  );

  Future<void> init() async {
    await _sharedPref.init();
  }

  ThemeData? setTheme(BuildContext context) {
    final _mobileThemeData = _mainTheme.mobileThemeData();
    final _tabletThemeData = _mainTheme.tabletThemeData();

    if (kIsWeb) {
      return DeviceSizes.isMobileSize(context) ? _mobileThemeData : _tabletThemeData;
    } else {
      return _mobileThemeData;
    }
  }
}
