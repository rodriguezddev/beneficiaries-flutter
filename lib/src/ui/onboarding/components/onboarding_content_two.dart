import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/spacings.dart';
import '../../../core/bloc/theme/theme_bloc.dart';
import '../../kommons/text_styles.dart';

class OnboardingContentTwo extends StatelessWidget {
  const OnboardingContentTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Spacings.spacing02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    left: Spacings.spacing02,
                    right: Spacings.spacing02,
                    bottom: 50,
                  ),
                  width: 150,
                  child: Text(
                    Constants.benefitPlanText,
                    style: TextStyle(
                      color: themeState.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Image(
                  image: AssetImage(
                    AssetConstants.onBoardingBoy,
                  ),
                  height: 193.0,
                  width: 136.0,
                ),
                const SizedBox(height: 18.0),
                SizedBox(
                  height: 95,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Constants.onBoardingTwoText,
                          style: TextStyles.buildTextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
