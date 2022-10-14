import 'package:flutter/material.dart';

import '../../core/constants/spacings.dart';

class GeneralInput extends StatelessWidget {
  const GeneralInput({
    Key? key,
    required this.spacing01,
    required this.spacing02,
    required this.spacing03,
    required this.primaryColor,
    required this.borderColor,
    required this.actionInput,
    this.keyBoardType,
    this.placeHolderText,
    this.labelText,
    this.width,
    this.maxLength,
    this.generalIcon,
    this.focusNode,
  }) : super(key: key);

  final Function(String text) actionInput;
  final Color borderColor;
  final Color primaryColor;
  final String? placeHolderText;
  final String? labelText;
  final FocusNode? focusNode;
  final TextInputType? keyBoardType;
  final double spacing01;
  final double spacing02;
  final double spacing03;
  final double? width;
  final int? maxLength;
  final Widget? generalIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(
        top: spacing03,
        left: spacing02,
        right: spacing02,
      ),
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: primaryColor,
            ),
            labelStyle: TextStyle(
              color: primaryColor,
            ),
          ),
        ),
        child: TextField(
          focusNode: focusNode,
          keyboardType: keyBoardType,
          maxLength: maxLength,
          onChanged: (value) => {
            actionInput(value),
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(Spacings.borderRadius01),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(Spacings.borderRadius01),
            ),
            prefixIcon: generalIcon,
            hintText: placeHolderText,
            labelText: labelText,
          ),
        ),
      ),
    );
  }
}
