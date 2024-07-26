import "package:ekub_app/theme/app_theme.dart";
import "package:ekub_app/utils/Share_preference.dart";
import "package:flutter/material.dart";

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    _initNightMode();
  }
  bool _isLightMode = true;
  ThemeData _themeData = const ApplicationTheme(true).themeData;
  // getter
  bool get mode => _isLightMode;
  ThemeData get themeDta => _themeData;

  // setter
  void changeTheme() {
    if (_isLightMode) {
      _isLightMode = !_isLightMode;
      _themeData = ThemeData.dark();
    } else {
      _isLightMode = !_isLightMode;
      _themeData = ThemeData.light();
    }
    notifyListeners();
  }

  // Initialize night mode state
  Future<void> _initNightMode() async {
    // get night mode state
    _isLightMode =
        LocalDataStore.getDataString('isNightMode') == "true" ? false : true;
    _themeData = ApplicationTheme(_isLightMode).themeData;
    notifyListeners();
  }
}
