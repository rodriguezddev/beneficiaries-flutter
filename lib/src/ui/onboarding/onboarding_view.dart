import 'package:flutter/material.dart';

import 'components/onboarding_content.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingView createState() => _OnBoardingView();
}

class _OnBoardingView extends State<OnBoardingView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardingContent();
  }
}
