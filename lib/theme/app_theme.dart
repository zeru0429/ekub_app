import 'package:flutter/material.dart';

class ApplicationTheme {
  const ApplicationTheme(this.isLight);
  final bool isLight;

  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: isLight ? _lightColorScheme : _darkColorScheme,
        appBarTheme: _appBarTheme,
        bottomAppBarTheme: _bottomAppBarTheme,
        actionIconTheme: _actionIconTheme,
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
        datePickerTheme: _datePickerTheme,
        dialogTheme: _dialogTheme,
        drawerTheme: _drawerTheme,
        navigationBarTheme: _navigationBarTheme,
      );

  // color scheme for light mode
  final ColorScheme _lightColorScheme = const ColorScheme(
    primary: Color(0xFF6F3478), // #6F3478 - Purple
    // primaryVariant: Color(0xFF6F3478), // Darker shade of primary color, if needed
    secondary: Color(0xFFFFFFFF), // #ffffff - White
    // secondaryVariant: Color(0xFFFFFFFF), // Darker shade of secondary color, if needed
    surface: Color(0xFFFFFFFF), // Surface color (usually background)
    background: Color(0xFFFFFFFF), // Background color
    error: Colors.redAccent, // Error color
    onPrimary: Color(0xFFFFFFFF), // Text/icon color on primary color
    onSecondary: Color(0xFF000000), // Text/icon color on secondary color
    onSurface: Color(0xFF000000), // Text/icon color on surface
    onBackground: Color(0xFF000000), // Text/icon color on background
    onError: Color(0xFFFFFFFF), // Text/icon color on error
    brightness: Brightness.light, // Brightness (light or dark)
  );

  // color scheme for dark mode
  final ColorScheme _darkColorScheme = const ColorScheme(
    primary: Color(0xFF6F3478), // #6F3478 - Purple
    // primaryVariant: Color(0xFF6F3478), // Darker shade of primary color, if needed
    secondary: Color(0xFFFFFFFF), // #ffffff - White
    // secondaryVariant: Color(0xFFFFFFFF), // Darker shade of secondary color, if needed
    surface: Color(0xFF1F1929), // Surface color (usually background)
    background: Color(0xFF241E30), // Background color
    error: Colors.redAccent, // Error color
    onPrimary: Color(0xFFFFFFFF), // Text/icon color on primary color
    onSecondary: Color(0xFF000000), // Text/icon color on secondary color
    onSurface: Color(0xFFFFFFFF), // Text/icon color on surface
    onBackground: Color(0xFFFFFFFF), // Text/icon color on background
    onError: Color(0xFFFFFFFF), // Text/icon color on error
    brightness: Brightness.dark, // Brightness (light or dark)
  );
// app bar theme
  AppBarTheme get _appBarTheme => const AppBarTheme();
  // bottom app bar theme
  BottomAppBarTheme get _bottomAppBarTheme => const BottomAppBarTheme();
  // action icon theme
  ActionIconThemeData get _actionIconTheme => const ActionIconThemeData();

  // bottom navigation bar theme
  BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData();

  // date picker theme
  DatePickerThemeData get _datePickerTheme => const DatePickerThemeData();

  // dialog theme
  DialogTheme get _dialogTheme => const DialogTheme();

  // drawer theme
  DrawerThemeData get _drawerTheme => const DrawerThemeData();

  // navigation bar theme
  NavigationBarThemeData get _navigationBarTheme =>
      const NavigationBarThemeData();
}
