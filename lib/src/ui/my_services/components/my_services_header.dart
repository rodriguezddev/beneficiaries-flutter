import 'package:flutter/material.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/spacings.dart';
import '../../../core/models/user/bamba_user.dart';
import '../../../core/utils/utils.dart';
import '../../kommons/image_content.dart';
import '../../kommons/text_content.dart';

class MyServicesHeaderView extends StatelessWidget {
  const MyServicesHeaderView({
    Key? key,
    this.width,
    this.headerColor,
    this.textColor,
    this.textTitleColor,
    this.user,
  }) : super(key: key);

  final double? width;
  final Color? headerColor;
  final Color? textColor;
  final Color? textTitleColor;
  final BambaUser? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: width,
      padding: const EdgeInsets.only(
        top: Spacings.spacing04,
        left: Spacings.spacing02,
        right: Spacings.spacing02,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25.0),
          bottomLeft: Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: headerColor,
      ),
      child: Column(
        children: [
          const ImageContent(
            assets: AssetConstants.logo,
            width: 106,
            height: Spacings.spacing02,
          ),
          const SizedBox(
            height: 32,
          ),
          TextContent(
            title: "¡${Constants.helloText}, ${user?.name}!",
            textColor: textColor,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 8,
          ),
          TextContent(
            title: '${Constants.budgetText}:',
            textColor: textTitleColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 15,
          ),
          TextContent(
            title:
              "${Utils.getBambaBalance(user?.bambaBalance)} ${Constants.pointText}",
            textColor: textColor,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
