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
}
