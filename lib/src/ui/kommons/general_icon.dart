import 'package:flutter/material.dart';

class GeneralIcon extends StatelessWidget {
  const GeneralIcon ({
    Key? key,
    this.icon,
    this.iconColor,
  }): super(key: key);

  final Color? iconColor;
  final IconData? icon;

  @override
  Widget build (BuildContext context) {
    return Icon(
      icon,
      color: iconColor,
    );
  }
}
