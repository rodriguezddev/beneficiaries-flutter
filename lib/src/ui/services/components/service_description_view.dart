import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../core/bloc/product/product_bloc.dart';
import '../../../core/bloc/theme/theme_bloc.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/analytics_constants.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/bamba_routes.dart';
import '../../../core/models/products/product.dart';
import '../../../core/utils/analytics_utils.dart';
import '../../../core/utils/base_status.dart';
import '../../kommons/accordion.dart';
import '../../kommons/bamba_layout.dart';

class ServiceDescriptionView extends StatelessWidget {
  const ServiceDescriptionView({
    Key? key,
    required this.product,
    this.active,
  }) : super(key: key);

  final Product product;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    final body = _getBody(context);

    return kIsWeb
      ? body
      : BambaLayout(
          child: body,
        );
  }

  _getBody(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    ProductBloc? productBloc = context.read<ProductBloc>();
    Map<String, dynamic>? products;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: ImageIcon(
                const AssetImage(AssetConstants.arrowLeft),
                size: 25,
                color: state.primaryColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              '${product.name}',
              style: TextStyle(
                color: state.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 28,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 13),
                  width: width,
                  child: Text(
                    '${product.brief}',
                    style: TextStyle(
                      color: state.textSubTitleColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                for (var productDescription in product.description!)
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Accordion(
                          title: '${productDescription.section}',
                          content: productDescription.body!,
                        ),
                      ],
                    ),
                  ),
                Text(
                  Constants.totalText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: state.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '${product.price} ${Constants.productPriceText}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: state.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                if (active != null && active! == false)
                  BlocBuilder<ProductBloc, ProductState>(
                    buildWhen: (previousState, currentState) {
                      if (previousState.productStatus == BaseStatus.success) {
                        productBloc.add(
                          GetServices(),
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          BambaRoutes.serviceSuccess,
                          arguments: products,
                        );
                        return false;
                      }

                      if (previousState.productStatus == BaseStatus.failed) {
                        final snackBar = SnackBar(
                          content: Text(
                            '${currentState.onErrorMessage}',
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackBar,
                        );
                      }

                      return true;
                    },
                    builder: ((context, stateProduct) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 65,
                            vertical: 15,
                          ),
                          backgroundColor: state.accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 0.0,
                          fixedSize: Size(
                            width,
                            48,
                          ),
                        ),
                        onPressed:
                          stateProduct.productStatus == BaseStatus.onRequest
                            ? null
                            : () async {
                              AnalyticsUtils.logEvent(
                                name: AnalyticsConstants
                                  .activeButtonSingleProduct,
                              );
                              List<Product> productId = [
                                Product(
                                  sku: product.sku,
                                ),
                              ];
                              products = {
                                '${product.sku}': {'product': product},
                              };
                              productBloc.add(
                                BuyProducts(
                                  productsToActive: productId,
                                ),
                              );
                            },
                        child: const Text(
                          Constants.activeText,
                        ),
                      );
                    }),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
