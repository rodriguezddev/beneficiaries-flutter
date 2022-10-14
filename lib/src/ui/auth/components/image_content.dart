import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  const ImageContent ({
    Key? key,
    required this.assets,
}) : super (key: key);

  final String assets;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: Image.asset(
        assets,
        width: 126,
        height: 110,
      ),
    );
  }
}
