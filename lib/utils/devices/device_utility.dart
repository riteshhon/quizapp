import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDeviceUtility {
  AppDeviceUtility._();

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(
      {required Color color, bool darkStatusBarIcon = true}) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness:
            darkStatusBarIcon ? Brightness.dark : Brightness.light,
      ),
    );
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
