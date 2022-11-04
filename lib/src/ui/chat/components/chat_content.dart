import 'package:flutter/material.dart';

import '../../kommons/general_button.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/models/user/bamba_user.dart';
import '../../../core/utils/utils.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({
    Key? key,
    required this.accentColor,
    required this.textColor,
    required this.bambaUser,
  }) : super(key: key);
  final Color accentColor;
  final Color textColor;
  final BambaUser? bambaUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                width: 203,
                child: Text(
                  '¡${Constants.helloText} ${bambaUser?.name}! ${Constants.needSupportText}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  AssetConstants.onBoardingGirl,
                  width: 285,
                  height: 224,
                ),
              ),
              GeneralButton(
                title: Constants.startChatText,
                bgColor: accentColor,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                onPressed: () {
                  Utils.launchURL(Constants.supportUrlText);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
