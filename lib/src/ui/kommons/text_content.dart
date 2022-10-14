import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  const TextContent({
    Key? key,
    required this.title,
    this.textColor,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  final String title;
  final TextAlign? textAlign;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {

    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
