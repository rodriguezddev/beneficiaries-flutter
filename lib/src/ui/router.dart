import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'webviews/chat_webview.dart';
import 'web/profile_web_view.dart';
import '../core/models/products/product.dart';
import 'services/components/service_description_view.dart';
import 'customer/profile_view.dart';
import 'home/home_web_view.dart';
import '../core/constants/constants.dart';
import 'onboarding/onboarding_view.dart';
import 'home/home_screen.dart';
import '../core/constants/bamba_routes.dart';
import 'auth/confirmation_view.dart';
import 'auth/register_view.dart';
import 'web/chat_web_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case BambaRoutes.home:
      return MaterialPageRoute(
        builder: (_) => kIsWeb ? HomeWebView() : const HomeScreen(),
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
    case BambaRoutes.serviceDescription:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args["product"] as Product;
      final active = args["active"];
  
      return MaterialPageRoute(
        builder: (_) => ServiceDescriptionView(
          product: product,
          active: active,
        ),
      );
    case BambaRoutes.profileView:
      return MaterialPageRoute(
        builder: (_) => const ProfileView(),
      );

    case BambaRoutes.chatWeb:
      return MaterialPageRoute(
        builder: (_) => ChatWebScreen(),
      );
    case BambaRoutes.profileWeb:
      return MaterialPageRoute(
        builder: (_) => ProfileWebView(),
      );
    case BambaRoutes.chatWebView:
      return MaterialPageRoute(
        builder: (_) => ChatWebView(),
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
