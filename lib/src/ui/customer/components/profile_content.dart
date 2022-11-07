import 'package:flutter/material.dart';

import '../../kommons/text_content.dart';
import '../../../core/models/products/product.dart';
import '../../kommons/service_card.dart';
import '../../../core/constants/spacings.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/color_palette.dart';
import '../../../core/models/services/bamba_service.dart';
import '../../../core/models/user/bamba_user.dart';
import '../../../core/utils/utils.dart';
import '../../kommons/shared_widgets.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    Key? key,
    required this.headerColor,
    required this.textColor,
    required this.bambaUser,
    required this.myServices,
    required this.product,
    required this.activatedPlans,
    required this.onCancelService,
  }) : super(key: key);

  final Color textColor;
  final Color headerColor;
  final BambaUser? bambaUser;
  final List<BambaService> myServices;
  final List<Product> product;
  final Map<String, dynamic> activatedPlans;
  final void Function(BambaService)? onCancelService;

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
                color: headerColor,
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
                  TextContent(
                    title: "${bambaUser?.name}",
                    textColor: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  TextContent(
                    title:
                      "${bambaUser == null ? 0 : Utils.getAge(bambaUser!.birthdate!)} ${Constants.yearsText}",
                    textColor: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
              child: TextContent(
                title: Constants.hiredServicesText,
                textColor: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SharedWidgets.drawLineContainer(
              context,
              const EdgeInsets.symmetric(vertical: 12),
            ),
            if (myServices != null)
              for (var service in myServices!)
                Column(
                  children: [
                    ServiceCard(
                      cancel: true,
                      activatedPlans: activatedPlans,
                      product: service,
                      active: true,
                      bambaService: service,
                      cancelPlan: (service) {
                        onCancelService!(service);
                      },
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
