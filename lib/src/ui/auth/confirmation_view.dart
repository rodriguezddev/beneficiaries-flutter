import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/utils.dart';
import '../../core/bloc/theme/theme_bloc.dart';
import '../../core/bloc/confirmation/confirmation_bloc.dart';
import '../../core/bloc/auth/auth_user/auth_bloc.dart';
import '../../core/constants/bamba_routes.dart';

import 'components/confirmation_content.dart';

class ConfirmationView extends StatefulWidget {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  _ConfirmationView createState() => _ConfirmationView();
}

class _ConfirmationView extends State<ConfirmationView> {
  ConfirmationBloc? _confirmationBloc;
  AuthBloc? _authBloc;

  @override
  void initState() {
    super.initState();
    _confirmationBloc = context.read<ConfirmationBloc>();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<ConfirmationBloc, ConfirmationState>(
          buildWhen: (previousState, newState) {
            Utils.onFocusScope(context, newState);

            if (newState.theCodeIsValid == true) {
              Navigator.of(context).pushReplacementNamed(
                BambaRoutes.onBoarding,
              );
              return false;
            }

            if (newState.theCodeIsValid == false) {
              // TODO: snackbar replacement by showSnackBar method
              const snackBar = SnackBar(
                content: Text(Constants.digitLengthErrorText),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

            return true;
          },
          builder: (context, state) {
            return ConfirmationContent(
              getFirstNumber: (
                String codeNumberValid,
                getContext,
              ) {
                _confirmationBloc?.add(
                  GetFirstDigitEvent(
                    firstDigit: codeNumberValid,
                    context: getContext,
                  ),
                );
              },
              getSecondNumber: (
                String codeNumberValid,
                getContext,
              ) {
                _confirmationBloc?.add(
                  GetSecondDigitEvent(
                    secondDigit: codeNumberValid,
                    context: getContext,
                  ),
                );
              },
              getThirdNumber: (
                String codeNumberValid,
                getContext,
              ) {
                _confirmationBloc?.add(
                  GetThirdDigitEvent(
                    thirdDigit: codeNumberValid,
                    context: getContext,
                  ),
                );
              },
              getFourthNumber: (String codeNumberValid) {
                _confirmationBloc?.add(
                  GetFourthDigitEvent(
                    firstDigit: state.firstDigit,
                    secondDigit: state.secondDigit,
                    thirdDigit: state.thirdDigit,
                    fourthDigit: codeNumberValid,
                  ),
                );
              },
              sendData: () {
                _authBloc?.add(
                  ValidateUserLoggingEvent(
                    cellphone: state.cellphone,
                    pin: state.codeNumber,
                  ),
                );
              },
              isValid: state.theCodeIsValid,
              focusSecondTrue: state.secondTextFieldFocus,
              focusThirdTrue: state.thirdTextFieldFocus,
              focusFourthTrue: state.fourthTextFieldFocus,
              primaryColor: themeState.primaryColor,
              accentColor: themeState.accentColor,
              textColor: themeState.textColor,
            );
          },
        );
      },
    );
  }

  void _sendToLoginScreen() {
    Navigator.pushReplacementNamed(
      context,
      BambaRoutes.login,
    );
  }
}
