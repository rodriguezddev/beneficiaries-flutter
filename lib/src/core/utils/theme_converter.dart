import 'package:flutter/material.dart';

import '../constants/color_palette.dart';
import '../models/theme/bamba_theme.dart';
import 'string_to_color.dart';

class ThemeConverter {
  BambaTheme? _bambaTheme;
  BambaTheme? get bambaTheme => _bambaTheme;

  Color get accentColor => StringToColor.convertToColor(
    colorText: _bambaTheme?.palette?.accentColor,
    defaultColor: ColorPalette.accent,
  );

  Color get accentControls => StringToColor.convertToColor(
    colorText: _bambaTheme?.palette?.accentControls,
    defaultColor: ColorPalette.green,
  );

  Color get primaryColor => StringToColor.convertToColor(
    colorText: _bambaTheme?.palette?.primaryColor,
    defaultColor: ColorPalette.dark,
  );

  Color get secondaryColor => StringToColor.convertToColor(
    colorText: _bambaTheme?.palette?.secondaryColor,
    defaultColor: ColorPalette.accent,
  );

  Color get headerColor => StringToColor.convertToColor(
    colorText: _bambaTheme?.palette?.headerColor,
    defaultColor: ColorPalette.headerColor,
  );

  Color get textTitleColor => StringToColor.convertToColor(
    colorText: _bambaTheme?.palette?.textTitleColor,
    defaultColor: ColorPalette.cultured80,
  );

  Color get textColor => StringToColor.convertToColor(
    colorText: _bambaTheme?.palette?.textColor,
    defaultColor: ColorPalette.dark,
  );

  Color get subtitleTextColor => StringToColor.convertToColor(
    colorText: _bambaTheme?.palette?.textSubTitleColor,
    defaultColor: ColorPalette.grayText1,
  );

  String? get logo => _bambaTheme?.logoUrl;

  ThemeData buildTheme() {
    return ThemeData(
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      canvasColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      indicatorColor: accentColor,
      primaryColor: accentColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
      ),
    );
  }

  void initializeTheme(BambaTheme theme) {
    _bambaTheme = theme;
  }
}
