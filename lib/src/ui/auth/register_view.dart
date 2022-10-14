import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/constants.dart';
import '../../core/bloc/theme/theme_bloc.dart';
import '../../core/constants/bamba_routes.dart';
import '../../core/bloc/auth/auth_user/auth_bloc.dart';
import '../../core/bloc/register/register_bloc.dart';
import '../../core/utils/base_status.dart';
import '../../core/utils/utils.dart';

import 'components/register_content.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterView createState() => _RegisterView();
}

class _RegisterView extends State<RegisterView> {
  RegisterBloc? _registerBloc;
  AuthBloc? _authBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = context.read<RegisterBloc>();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previousState, newState) {
        if (newState.status == BaseStatus.success) {
          Navigator.of(context).pushReplacementNamed(
            BambaRoutes.confirmation,
          );
          return false;
        }

        if (newState.status == BaseStatus.failed) {
          Utils.showSnackBar(
            context: context,
            message: newState.onErrorMessage,
          );
        }

        return true;
      },
      builder: (context, themeState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<RegisterBloc, RegisterState>(
              buildWhen: (previousState, newState) {
                if (!newState.phoneNumberValid) {
                  Utils.showSnackBar(
                    context: context,
                    message: Constants.phoneErrorText,
                  );
                }

                return true;
              },
              builder: (context, state) {
                return RegisterContent(
                  getPhone: (String phone) {
                    _registerBloc?.add(
                      GetPhoneEvent(cellphone: phone),
                    );
                  },
                  sendPin: () {
                    _authBloc?.add(
                      SendPinEvent(cellphone: state.phoneNumber),
                    );
                  },
                  primaryColor: themeState.primaryColor as Color,
                  accentColor: themeState.accentColor as Color,
                  textColor: themeState.textColor as Color,
                );
              },
            );
          },
        );
      },
    );
  }
}
