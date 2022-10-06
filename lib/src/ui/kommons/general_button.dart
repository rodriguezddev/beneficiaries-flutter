import 'package:flutter/material.dart';

import '../../core/constants/spacings.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.onPressed,
    this.horizontalPadding = 65,
    this.verticalPadding = 15,
  }) : super(key: key);

  final Color bgColor;
  final String title;
  final double horizontalPadding;
  final double verticalPadding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Spacings.borderRadius02,
          ),
        ),
        elevation: 0.0,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
