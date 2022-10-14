import 'dart:ui';
import 'package:flutter/material.dart';

import 'confirmation_input.dart';
import 'image_content.dart';
import '../../kommons/general_button.dart';
import '../../kommons/text_content.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/spacings.dart';

class ConfirmationContent extends StatelessWidget {
  const ConfirmationContent({
    Key? key,
    required this.getFirstNumber,
    required this.getSecondNumber,
    required this.getThirdNumber,
    required this.getFourthNumber,
    required this.focusSecondTrue,
    required this.focusThirdTrue,
    required this.focusFourthTrue,
    required this.sendData,
    required this.primaryColor,
    required this.accentColor,
    required this.textColor,
    this.isValid,
  }) : super(key: key);

  final void Function(String codeNumberValid, dynamic getContext)
      getFirstNumber;
  final void Function(String codeNumberValid, dynamic getContext)
      getSecondNumber;
  final void Function(String codeNumberValid, dynamic getContext)
      getThirdNumber;
  final void Function(String codeNumberValid) getFourthNumber;
  final void Function() sendData;
  final FocusNode focusSecondTrue;
  final FocusNode focusThirdTrue;
  final FocusNode focusFourthTrue;
  final Color primaryColor;
  final Color accentColor;
  final Color textColor;
  final bool? isValid;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const spacing02 = Spacings.spacing02;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.only(
                top: Spacings.spacing01,
                left: Spacings.spacing03,
                right: Spacings.spacing03,
              ),
              child: Column(
                children: [
                  const ImageContent(
                    assets: AssetConstants.code,
                  ),
                  const SizedBox(height: spacing02),
                  TextContent(
                    title: Constants.enterCodeText,
                    textColor: textColor,
                    fontSize: 28,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.only(
                left: 85,
                right: 85,
              ),
              child: TextContent(
                title: Constants.securityCodeText,
                textColor: textColor,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(
                horizontal: Spacings.spacing03,
                vertical: Spacings.spacing03,
              ),
              child: TextContent(
                title: Constants.writeCodeText,
                textColor: textColor,
                fontSize: 16,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: spacing02),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConfirmationInput(
                        actionInput: (value) => getFirstNumber(
                          value,
                          context,
                        ),
                        inputColor: primaryColor,
                      ),
                      ConfirmationInput(
                        actionInput: (value) => getSecondNumber(
                          value,
                          context,
                        ),
                        inputColor: primaryColor,
                        focusNode: focusSecondTrue,
                      ),
                      ConfirmationInput(
                        actionInput: (value) => getThirdNumber(
                          value,
                          context,
                        ),
                        inputColor: primaryColor,
                        focusNode: focusThirdTrue,
                      ),
                      ConfirmationInput(
                        actionInput: (value) => getFourthNumber(value),
                        inputColor: primaryColor,
                        focusNode: focusFourthTrue,
                      ),
                    ],
                  ),
                  // TODO: add code to resend pin
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 65,
                vertical: 25,
              ),
              child: Column(
                children: [
                  GeneralButton(
                    title: Constants.validateCodeButtonText,
                    bgColor: accentColor,
                    onPressed: () async {
                      sendData();
                    },
                  ),
                  const SizedBox(
                    height: spacing02,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
