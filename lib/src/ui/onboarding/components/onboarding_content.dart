import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';

import '../../../core/bloc/theme/theme_bloc.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/spacings.dart';
import 'build_page_indicator_content.dart';
import '../../../core/constants/bamba_routes.dart';
import '../../kommons/bamba_layout.dart';
import '../../kommons/general_button.dart';
import '../../../core/constants/asset_constants.dart';
import '../../kommons/image_content.dart';
import '../../kommons/general_icon.dart';

import 'onboarding_card.dart';
import 'onboarding_card_two.dart';

class OnBoardingContent extends StatefulWidget {
  const OnBoardingContent({
    Key? key,
  }) : super(key: key);

  @override
  _OnBoardingContent createState() => _OnBoardingContent();
}

class _OnBoardingContent extends State<OnBoardingContent> {
  final int numPages = 2;
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: .99,
  );
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  void buttonAction() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      BambaRoutes.home,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final body = _buildBody(context);
    return kIsWeb ? body : BambaLayout(child: body);
  }

  BlocBuilder<ThemeBloc, ThemeState> _buildBody(BuildContext context) {
    final int ultimatePage = numPages - 1;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Scaffold(
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: Spacings.spacing05,
                  left: Spacings.spacing02,
                  right: Spacings.spacing02,
                  bottom: 15,
                ),
                child: ImageContent(
                  assets: AssetConstants.logo,
                  width: 106,
                  height: Spacings.spacing02,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        Spacings.borderRadius01,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                buttonAction();
                              },
                              child: const GeneralIcon(
                                icon: Icons.close,
                                iconColor: Colors.grey,
                                size: 24.0,
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: PageView(
                            scrollBehavior:
                                const MaterialScrollBehavior().copyWith(
                              dragDevices: {
                                PointerDeviceKind.mouse,
                                PointerDeviceKind.touch,
                              },
                            ),
                            physics: const ClampingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(
                                () {
                                  currentPage = page;
                                },
                              );
                            },
                            children: const <Widget>[
                              OnboardingCard(),
                              OnboardingCardTwo()
                            ],
                          ),
                        ),
                        if (currentPage == ultimatePage)
                          GeneralButton(
                            title: Constants.continueText,
                            bgColor: themeState.accentColor as Color,
                            onPressed: buttonAction,
                          ),
                        const SizedBox(
                          height: Spacings.spacing03,
                        ),
                        BuildPageIndicatorContent(
                          numPages: numPages,
                          currentPage: currentPage,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
