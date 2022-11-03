import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/spacings.dart';
import '../../../core/models/products/product.dart';
import '../../../core/utils/utils.dart';
import '../../kommons/custom_dialog.dart';
import '../../kommons/text_content.dart';

class ActiveServiceButtonView extends StatelessWidget {
  const ActiveServiceButtonView({
    Key? key,
    required this.activatedPlans,
    required this.buyPlan,
    this.width,
    this.accentControls,
    this.textTitleColor,
    this.textColor,
    this.primaryColor,
  }) : super(key: key);

  final double? width;
  final Color? accentControls;
  final Color? primaryColor;
  final Color? textColor;
  final Color? textTitleColor;
  final Map<String, dynamic> activatedPlans;
  final Function(List<Product>) buyPlan;

  void handleBuyProduct() async {
    List<Product> productsToActive = activatedPlans.entries
        .map(
          (productToActive) => Product(sku: productToActive.key),
        )
        .toList();

    await buyPlan(productsToActive);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: Spacings.spacing02,
        right: Spacings.spacing02,
        top: 12,
      ),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextContent(
            title: Constants.availableText,
            textColor: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              backgroundColor: accentControls,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: activatedPlans.isEmpty
              ? null
              : () => {
                CustomDialog.showCustomDialog(
                  context: context,
                  title: Utils.getProductsName(activatedPlans),
                  textAcceptButton: Constants.sureText,
                  textCancelButton: Constants.notSureText,
                  handleConfirm: () {
                  handleBuyProduct();
                },
                  color: primaryColor as Color,
              )
            },
            child: const Text(Constants.activeText),
          ),
        ],
      ),
    );
  }
}
