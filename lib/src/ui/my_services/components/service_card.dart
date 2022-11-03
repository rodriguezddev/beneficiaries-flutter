import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_status.dart';
import '../../../core/utils/utils.dart';
import '../../../core/bloc/product/product_bloc.dart';
import '../../../core/models/services/bamba_service.dart';
import '../../kommons/custom_dialog.dart';
import '../../../core/constants/spacings.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/bamba_routes.dart';
import '../../../core/models/products/product.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key? key,
    required this.product,
    required this.accentControls,
    required this.subtitleTextColor,
    required this.primaryColor,
    required this.accentColor,
    required this.textColor,
    required this.activatedPlans,
    required this.cancel,
    this.cancelPlan,
    this.productStatus,
    this.active,
    this.bambaService,
  }) : super(key: key);

  final Product product;
  final bool? active;
  final Color subtitleTextColor;
  final Color primaryColor;
  final Color accentColor;
  final Color textColor;
  final Color accentControls;
  final Map<String, dynamic> activatedPlans;
  final BambaService? bambaService;
  final BaseStatus? productStatus;
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
                      color: widget.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      "${widget.product.price?.toInt()} ${Constants.productPriceText}",
                      style: TextStyle(
                        color: widget.subtitleTextColor,
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
                        color: widget.textColor,
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
                    trackColor: widget.subtitleTextColor,
                    activeColor: widget.accentControls,
                    value: widget.activatedPlans![widget.product.sku] != null
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
                          color: widget.primaryColor,
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
                              widget.activatedPlans?.remove(widget.product.sku);
                            },
                          );
                          return;
                        }
                        setState(
                          () {
                            widget.activatedPlans!["${widget.product.sku}"] = {
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
  }
}
