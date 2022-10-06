import 'package:flutter/material.dart';

import '../../core/constants/color_palette.dart';

class TextStyles {
  static TextStyle buildTextStyle() {
    return const TextStyle(
      fontFamily: 'DIN2014',
      color: ColorPalette.dark,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
      height: 2,
    );
  }
}
