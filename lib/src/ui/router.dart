import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../core/constants/constants.dart';
import 'onboarding/onboarding_view.dart';
import 'home/home_screen.dart';
import '../core/constants/bamba_routes.dart';
import 'auth/confirmation_view.dart';
import 'auth/register_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case BambaRoutes.home:
      return MaterialPageRoute(
        //TODO:add home view web
        builder: (_) => /*kIsWeb ? HomeWebView() :*/ const HomeScreen(),
      );
    case BambaRoutes.login:
      return MaterialPageRoute(
        builder: (_) => const RegisterView(),
      );
    case BambaRoutes.confirmation:
      final String? phoneNumber = settings.arguments as String?;
      return MaterialPageRoute(
        builder: (_) => ConfirmationView(
          phoneNumber: phoneNumber,
        ),
      );
    case BambaRoutes.onBoarding:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('${Constants.noRoutesText} ${settings.name}'),
          ),
        ),
      );
  }
}
