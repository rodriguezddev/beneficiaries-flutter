import 'dart:ui';
import 'package:flutter/material.dart';

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
    required this.isValid,
    required this.sendData,
    required this.primaryColor,
    required this.accentColor,
    required this.textColor,
  }) : super(key: key);

  final void Function(String codeNumberValid, dynamic getContext)?
      getFirstNumber;
  final void Function(String codeNumberValid, dynamic getContext)?
      getSecondNumber;
  final void Function(String codeNumberValid, dynamic getContext)?
      getThirdNumber;
  final void Function(String codeNumberValid)? getFourthNumber;
  final void Function() sendData;
  final FocusNode focusSecondTrue;
  final FocusNode focusThirdTrue;
  final FocusNode focusFourthTrue;
  final bool? isValid;
  final Color? primaryColor;
  final Color? accentColor;
  final Color? textColor;

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
                top: 10,
                left: Spacings.spacing03,
                right: Spacings.spacing03,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: width,
                    child: Image.asset(
                      AssetConstants.code,
                      width: 126,
                      height: 110,
                    ),
                  ),
                  const SizedBox(height: spacing02),
                  Text(
                    Constants.enterCodeText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
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
              child: Text(
                Constants.securityCodeText,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(
                horizontal: Spacings.spacing03,
                vertical: Spacings.spacing03,
              ),
              child: Text(
                Constants.writeCodeText,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: spacing02),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.18,
                        child: Theme(
                          data: ThemeData(
                            primaryColor: primaryColor,
                            inputDecorationTheme: InputDecorationTheme(
                              hintStyle: TextStyle(
                                color: textColor,
                              ),
                              labelStyle: TextStyle(
                                color: textColor,
                              ),
                            ),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                              getFirstNumber!(value, context),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.18,
                        child: Theme(
                          data: ThemeData(
                            primaryColor: primaryColor,
                            inputDecorationTheme: InputDecorationTheme(
                              hintStyle: TextStyle(
                                color: textColor,
                              ),
                              labelStyle: TextStyle(
                                color: textColor,
                              ),
                            ),
                          ),
                          child: TextField(
                            focusNode: focusSecondTrue,
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                              getSecondNumber!(value, context),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.18,
                        child: Theme(
                          data: ThemeData(
                            primaryColor: primaryColor,
                            inputDecorationTheme: InputDecorationTheme(
                              hintStyle: TextStyle(
                                color: textColor,
                              ),
                              labelStyle: TextStyle(
                                color: textColor,
                              ),
                            ),
                          ),
                          child: TextField(
                            focusNode: focusThirdTrue,
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                              getThirdNumber!(value, context),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.18,
                        child: Theme(
                          data: ThemeData(
                            primaryColor: primaryColor,
                            inputDecorationTheme: InputDecorationTheme(
                              hintStyle: TextStyle(
                                color: textColor,
                              ),
                              labelStyle: TextStyle(
                                color: textColor,
                              ),
                            ),
                          ),
                          child: TextField(
                            focusNode: focusFourthTrue,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => getFourthNumber!(value),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!),
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!),
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 65,
                        vertical: 15,
                      ),
                      backgroundColor: accentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          spacing02,
                        ),
                      ),
                      elevation: 0.0,
                    ),
                    onPressed: () async {
                      sendData();
                    },
                    child: const Text(
                      Constants.validateCodeButtonText,
                    ),
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
