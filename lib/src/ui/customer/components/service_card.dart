import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/color_palette.dart';
import '../../../core/utils/utils.dart';
import '../../../core/models/bamba_service.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.bambaService,
    required this.onCancelService,
    this.active = true,
  }) : super(key: key);

  final void Function(String serviceId)? onCancelService;
  final BambaService bambaService;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 6,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${bambaService.name}",
                style: const TextStyle(
                  color: ColorPalette.dark,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 26,
                  maxHeight: 26,
                ),
                child: FittedBox(
                  child: CupertinoSwitch(
                    trackColor: ColorPalette.grayText1,
                    activeColor: ColorPalette.green,
                    value: active,
                    onChanged: (value) async {
                      if (onCancelService != null) {
                        onCancelService!(bambaService.id!);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => Utils.launchURL(
              bambaService.certificateLink!,
            ),
            child: const Text(
              "Ver detalle",
              style: TextStyle(
                  color: ColorPalette.dark,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
