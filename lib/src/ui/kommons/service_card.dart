import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/theme/theme_bloc.dart';
import '../../core/utils/base_status.dart';
import '../../core/utils/utils.dart';
import '../../core/bloc/product/product_bloc.dart';
import '../../core/models/services/bamba_service.dart';
import 'custom_dialog.dart';
import '../../core/constants/spacings.dart';
import '../../core/constants/constants.dart';
import '../../core/constants/bamba_routes.dart';
import '../../core/models/products/product.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key? key,
    required this.product,
    required this.activatedPlans,
    required this.cancel,
    this.cancelPlan,
    this.active,
    this.bambaService,
  }) : super(key: key);

  final Product product;
  final bool? active;
  final Map<String, dynamic> activatedPlans;
  final BambaService? bambaService;
  final Function(BambaService)? cancelPlan;
  final bool cancel;

  @override
  _ServiceCard createState() => _ServiceCard();
}

class _ServiceCard extends State<ServiceCard> {
  ProductBloc? _productBloc;

  @override
  void initState() {
    _productBloc = context.read<ProductBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacings.spacing02,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name!,
                        style: TextStyle(
                          color: themeState.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          "${widget.product.price?.toInt()} ${Constants.productPriceText}",
                          style: TextStyle(
                            color: themeState.textSubTitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: Constants.detailsButtonText,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  Navigator.of(context).pushNamed(
                                    BambaRoutes.serviceDescription,
                                    arguments: {
                                      'product': widget.product,
                                      'isActive': widget.active
                                    },
                                  );
                                },
                            ),
                          ],
                          style: TextStyle(
                            color: themeState.textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 26,
                      maxHeight: 26,
                    ),
                    child: FittedBox(
                      child: CupertinoSwitch(
                        trackColor: themeState.textSubTitleColor,
                        activeColor: themeState.accentControls,
                        value:
                          widget.activatedPlans![widget.product.sku] != null
                            ? widget.activatedPlans![widget.product.sku]
                              ['isActive']
                            : widget.active,
                        onChanged: (value) async {
                          if (widget.active!) {
                            CustomDialog.showCustomDialog(
                              context: context,
                              title: widget.product.name as String,
                              textAcceptButton: Constants.sureText,
                              textCancelButton: Constants.notSureText,
                              color: themeState.primaryColor as Color,
                              handleConfirm: () {
                                if (widget.cancel) {
                                  widget.cancelPlan!(
                                    widget.bambaService as BambaService,
                                  );
                                }
                              },
                            );
                          } else {
                            if (!value) {
                              setState(
                                () {
                                  widget.activatedPlans
                                    ?.remove(widget.product.sku);
                                },
                              );
                              return;
                            }
                            setState(
                              () {
                                widget.activatedPlans![
                                    "${widget.product.sku}"] = {
                                  'isActive': value,
                                  'product': widget.product
                                };
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
