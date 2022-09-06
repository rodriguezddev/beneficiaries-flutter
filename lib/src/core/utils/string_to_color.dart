import 'package:flutter/material.dart';

extension StringToColor on Color {
  static Color convertToColor({String? colorText, required Color defaultColor}) {
    if (colorText == null) {
      return defaultColor;
    }

    return fromString(colorText);
  }

  static Color fromString(String rgbString) {
    final buffer = rgbString.split(',');

    return Color.fromRGBO(
      int.parse(buffer[0]),
      int.parse(buffer[1]),
      int.parse(buffer[2]),
      double.parse(buffer[3]),
    );
  }
}
