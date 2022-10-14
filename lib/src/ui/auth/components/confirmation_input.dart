import 'package:flutter/material.dart';

import '../../../core/constants/spacings.dart';

class ConfirmationInput extends StatelessWidget {
  const ConfirmationInput({
    Key? key,
    required this.actionInput,
    this.inputColor,
    this.focusNode,
  }) : super(key: key);

  final Color? inputColor;
  final FocusNode? focusNode;
  final void Function(String) actionInput;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.18,
      child: Theme(
        data: ThemeData(
          primaryColor: inputColor,
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: inputColor,
            ),
            labelStyle: TextStyle(
              color: inputColor,
            ),
          ),
        ),
        child: TextField(
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          onChanged: (value) => {
            actionInput(value),
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: inputColor!,
              ),
              borderRadius: BorderRadius.circular(Spacings.borderRadius01),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: inputColor!,
              ),
              borderRadius: BorderRadius.circular(Spacings.borderRadius01),
            ),
          ),
        ),
      ),
    );
  }
}
