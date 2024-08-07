import 'package:flutter/material.dart';

Color changeColorFromhexToColor(String hex) {
  if (hex.length != 6 && hex.length != 8) {
    throw ArgumentError('Invalid hex string (must be 6 or 8 characters)');
  }

  int r, g, b, a;

  if (hex.length == 6) {
    r = int.parse(hex.substring(0, 2), radix: 16);
    g = int.parse(hex.substring(2, 4), radix: 16);
    b = int.parse(hex.substring(4, 6), radix: 16);
    a = 0xFF; // Fully opaque
  } else {
    r = int.parse(hex.substring(0, 2), radix: 16);
    g = int.parse(hex.substring(2, 4), radix: 16);
    b = int.parse(hex.substring(4, 6), radix: 16);
    a = int.parse(hex.substring(6, 8), radix: 16);
  }

  return Color.fromARGB(a, r, g, b);
}

Color changeColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor';
  }

  return Color(int.parse(hexColor, radix: 16));
}
