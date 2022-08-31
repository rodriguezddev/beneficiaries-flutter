import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/utils.dart';

class BambaLayout extends StatelessWidget {
  final bool isDarkStyle;
  final Widget child;
  const BambaLayout({Key? key, required this.child, this.isDarkStyle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDarkStyle
          ? Utils.darkSystemUiOverlayStyle()
          : Utils.lightSystemUiOverlayStyle(),
      child: child,
    );
  }
}
