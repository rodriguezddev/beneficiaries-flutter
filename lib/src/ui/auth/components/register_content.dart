import 'package:flutter/material.dart';

import '../../kommons/general_icon.dart';
import 'image_content.dart';
import '../../kommons/text_content.dart';
import '../../kommons/general_button.dart';
import '../../kommons/general_input.dart';
import '../../../core/constants/spacings.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/asset_constants.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({
    Key? key,
    required this.sendPin,
    required this.getPhone,
    required this.primaryColor,
    required this.accentColor,
    required this.textColor,
  }) : super(key: key);

  final void Function(String phone) getPhone;
  final Function() sendPin;
  final Color primaryColor;
  final Color accentColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const spacing02 = Spacings.spacing02;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.only(
                top: Spacings.spacing06,
                left: spacing02,
                right: spacing02,
              ),
              child: Column(
                children: [
                  TextContent(
                    title: Constants.welcomeToText,
                    fontSize: 32,
                    textColor: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: width,
                    child: Image.asset(
                      AssetConstants.logo,
                      width: 106,
                      height: spacing02,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.only(
                top: Spacings.spacing03,
                left: Spacings.spacing03,
                right: Spacings.spacing03,
              ),
              child: Column(
                children: [
                  const ImageContent(assets: AssetConstants.cellphone),
                  const SizedBox(height: spacing02),
                  TextContent(
                    title: Constants.enterPhoneText,
                    fontSize: 28,
                    textColor: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.only(
                left: Spacings.spacing08,
                right: Spacings.spacing08,
              ),
              child: TextContent(
                title: Constants.sendSmsText,
                fontSize: 16,
                textColor: textColor,
                textAlign: TextAlign.center,
              ),
            ),
            GeneralInput(
              actionInput: (text) {
                getPhone(text);
              },
              width: width,
              maxLength: 15,
              spacing01: Spacings.spacing01,
              spacing02: spacing02,
              spacing03: Spacings.spacing03,
              primaryColor: primaryColor,
              borderColor: primaryColor,
              generalIcon: GeneralIcon(
                iconColor: primaryColor,
                icon: Icons.call,
              ),
              placeHolderText: Constants.cellphonePlaceholderText,
              labelText: Constants.enterPinText,
              keyBoardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: false,
              ),
            ),
            GeneralButton(
              title: Constants.sendButtonText,
              bgColor: accentColor,
              onPressed: () async {
                await sendPin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
