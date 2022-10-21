import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  const ImageContent ({
    Key? key,
    required this.assets,
    required this.width,
    required this.height,
}) : super (key: key);

  final String assets;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: Image.asset(
        assets,
        width: width,
        height: height,
      ),
    );
  }
}
