import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/confirmation/confirmation_bloc.dart';
import 'ui/auth/confirmation_screen.dart';
import 'core/bloc/auth/auth_user/auth_bloc.dart';
import 'core/bloc/theme/theme_bloc.dart';
import 'core/locator/service_locator.dart';
import 'core/models/user/bamba_user.dart';

class BambaScreen extends StatefulWidget {
  const BambaScreen({super.key});

  @override
  _BambaScreen createState() => _BambaScreen();
}

class _BambaScreen extends State<BambaScreen> {
  @override
  void initState() {
    setUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bambaUser = BambaUser();
    bambaUser.birthdate = DateTime.now().subtract(
      const Duration(days: 365),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            AuthState(user: bambaUser),
          ),
        ),
        BlocProvider(
          create: (_) => ConfirmationBloc(),
        ),
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: const ConfirmationScreen(),
    );
  }
}
