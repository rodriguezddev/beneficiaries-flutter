import 'package:flutter/material.dart';

import '../../core/constants/color_palette.dart';

class SharedWidgets {
  static Widget drawLineContainer(
    BuildContext context,
    EdgeInsets margin,
  ) {
    return Container(
      margin: margin,
      width: MediaQuery.of(context).size.width,
      height: 1,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorPalette.dark.withOpacity(0.4),
          width: 1,
        ),
      ),
    );
  }

  static Widget buildPoint(Color? color) {
    return Container(
      margin: const EdgeInsets.only(top: 4, right: 4),
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  static Widget buildPointText(String text, Color? textColor) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
