import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../core/constants/spacings.dart';
import '../../../core/bloc/profile/profile_bloc.dart';
import '../../../core/bloc/theme/theme_bloc.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/color_palette.dart';
import '../../kommons/bamba_layout.dart';

class ServiceSuccess extends StatelessWidget {
  const ServiceSuccess({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    final body = _getBody(context);

    return kIsWeb
      ? body
      : BambaLayout(
          child: body,
        );
  }

  Scaffold _getBody(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, stateTheme) {
          return SingleChildScrollView(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(
                          AssetConstants.activePlan,
                        ),
                        height: 300.0,
                      ),
                      Container(
                        width: width,
                        padding: const EdgeInsets.symmetric(
                          vertical: 21,
                          horizontal: 21,
                        ),
                        margin: const EdgeInsets.only(bottom: 37),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ColorPalette.accentSquare,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: width,
                              margin: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                '¡${Constants.readyText} ${state.user?.name}!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: stateTheme.textColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                _namesServices(product),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: stateTheme.textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 65,
                            vertical: 15,
                          ),
                          backgroundColor: stateTheme.accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Spacings.borderRadius02),
                          ),
                          elevation: 0.0,
                          fixedSize: Size(
                            width,
                            48,
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          Constants.acceptText,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  String _namesServices(products) {
    List<String> namesServices = [];

    for (var item in products.keys) {
      namesServices = [...namesServices, products[item]['product'].name];
    }
    return 'Tu ${namesServices.join(', ')} se activ${namesServices.length > 1 ? 'aron' : 'ó'} con éxito';
  }
}
