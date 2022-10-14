import 'package:flutter/material.dart';

import '../../../core/constants/spacings.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_palette.dart';
import '../../../core/models/services/bamba_service.dart';
import '../../../core/models/user/bamba_user.dart';
import '../../../core/utils/utils.dart';
import '../../kommons/shared_widgets.dart';
import 'service_card.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    Key? key,
    required this.bambaUser,
    required this.services,
    required this.onCancelService,
  }) : super(key: key);

  final BambaUser? bambaUser;
  final List<BambaService>? services;
  final void Function(String serviceId)? onCancelService;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: width,
              padding: const EdgeInsets.only(
                top: Spacings.spacing04,
                left: Spacings.spacing02,
                right: Spacings.spacing02,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(Spacings.borderRadius025),
                  bottomLeft: Radius.circular(Spacings.borderRadius025),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: ColorPalette.headerColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: width,
                    child: Image.asset(
                      AssetConstants.logo,
                      width: 106,
                      height: Spacings.spacing02,
                    ),
                  ),
                  const SizedBox(
                    height: Spacings.spacing02,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage(AssetConstants.avatar),
                    backgroundColor: Colors.white,
                    radius: Spacings.spacing05,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${bambaUser?.name}",
                    style: const TextStyle(
                      color: ColorPalette.dark,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${bambaUser == null ? 0 : Utils.getAge(bambaUser!.birthdate!)} años ",
                    style: const TextStyle(
                      color: ColorPalette.dark,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacings.spacing02,
                vertical: 12,
              ),
              width: width,
              child: const Text(
                Constants.hiredServicesText,
                style: TextStyle(
                  color: ColorPalette.dark,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (onCancelService != null) {
                  // TODO: remove hardcore value
                  onCancelService!("Id de prueba");
                }
              },
              child: const Text(Constants.editProfileText),
            ),
            SharedWidgets.drawLineContainer(
              context,
              const EdgeInsets.symmetric(vertical: 12),
            ),
            if (services != null)
              for (var bambaService in services!)
                Column(
                  children: [
                    ServiceCard(
                      bambaService: bambaService,
                      onCancelService: onCancelService,
                    ),
                    SharedWidgets.drawLineContainer(
                      context,
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
