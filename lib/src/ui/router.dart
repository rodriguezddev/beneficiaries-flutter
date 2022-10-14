import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../core/constants/bamba_routes.dart';
import 'auth/confirmation_view.dart';
import 'auth/register_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case BambaRoutes.login:
      return MaterialPageRoute(
        builder: (_) => RegisterView(),
      );
    case BambaRoutes.confirmation:
      final String? phoneNumber = settings.arguments as String?;
      return MaterialPageRoute(
        builder: (_) => ConfirmationView(
          phoneNumber: phoneNumber,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
