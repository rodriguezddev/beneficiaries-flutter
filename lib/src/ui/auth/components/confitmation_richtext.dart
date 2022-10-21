import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class ConfirmationRichText extends StatelessWidget {
  const ConfirmationRichText({
    Key? key,
    this.actionText,
    this.textColor,
  }) : super(key: key);

  final Function()? actionText;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: Constants.reSendSecurityCodeText,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: Constants.clickHereText,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = actionText,
          ),
        ],
      ),
    );
  }
}
