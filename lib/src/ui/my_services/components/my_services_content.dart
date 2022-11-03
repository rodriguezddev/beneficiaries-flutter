import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'active_service_button.dart';
import 'my_services_header.dart';
import '../../../core/utils/utils.dart';
import '../../../core/utils/base_status.dart';
import '../../kommons/custom_dialog.dart';
import '../../kommons/text_content.dart';
import '../../../core/constants/constants.dart';
import '../../../core/models/products/product.dart';
import '../../../core/models/user/bamba_user.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/spacings.dart';
import '../../../core/models/services/bamba_service.dart';
import '../../kommons/image_content.dart';
import '../../kommons/shared_widgets.dart';

import 'service_card.dart';

class MyServicesContent extends StatelessWidget {
  const MyServicesContent({
    Key? key,
    required this.headerColor,
    required this.primaryColor,
    required this.accentColor,
    required this.textColor,
    required this.textTitleColor,
    required this.subtitleTextColor,
    required this.myServices,
    required this.accentControls,
    required this.product,
    required this.productStatus,
    required this.activatedPlans,
    required this.buyPlan,
    this.cancelPlan,
    this.user,
  }) : super(key: key);

  final Color headerColor;
  final Color subtitleTextColor;
  final Color textTitleColor;
  final Color primaryColor;
  final Color accentColor;
  final Color textColor;
  final Color accentControls;
  final List<BambaService> myServices;
  final List<Product> product;
  final BambaUser? user;
  final BaseStatus productStatus;
  final Map<String, dynamic> activatedPlans;
  final Function(List<Product>) buyPlan;
  final Function(BambaService)? cancelPlan;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool cancel;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyServicesHeaderView(
              width: width,
              headerColor: headerColor,
              textColor: textColor,
              textTitleColor: textTitleColor,
              user: user,
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
                title: Constants.chooseBenefitsText,
                textColor: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 2,
              ),
              width: width,
              child: TextContent(
                title: Constants.activateOrDesactivateText,
                textColor: textTitleColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (myServices.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(
                  left: Spacings.spacing02,
                  right: Spacings.spacing02,
                  top: 12,
                ),
                width: width,
                child: TextContent(
                  title: Constants.activePlanstext,
                  textColor: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            const SizedBox(
              height: 17,
            ),
            for (var service in myServices)
              Column(
                children: [
                  ServiceCard(
                    cancel: true,
                    activatedPlans: activatedPlans,
                    product: service,
                    active: true,
                    accentControls: accentControls,
                    primaryColor: primaryColor,
                    textColor: textColor,
                    accentColor: accentColor,
                    subtitleTextColor: subtitleTextColor,
                    bambaService: service,
                    productStatus: productStatus,
                    cancelPlan: (service) {
                      cancelPlan!(service);
                    },
                  ),
                  SharedWidgets.drawLineContainer(
                    context,
                    const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: 17,
            ),
            if (product.isNotEmpty)
              ActiveServiceButtonView(
                activatedPlans: activatedPlans,
                buyPlan: buyPlan,
                accentControls: accentControls,
                primaryColor: primaryColor,
                textColor: textColor,
                textTitleColor: textTitleColor,
                width: width,
              ),
            if (product.isNotEmpty)
              SharedWidgets.drawLineContainer(
                context,
                const EdgeInsets.symmetric(vertical: 12),
              ),
            for (var products in product)
              Column(
                children: [
                  ServiceCard(
                    activatedPlans: activatedPlans,
                    product: products,
                    active: false,
                    accentControls: accentControls,
                    subtitleTextColor: subtitleTextColor,
                    accentColor: accentColor,
                    textColor: textColor,
                    primaryColor: textColor,
                    cancel: false,
                  ),
                  SharedWidgets.drawLineContainer(
                    context,
                    const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
