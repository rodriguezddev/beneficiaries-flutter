import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../kommons/screen_loading_logo.dart';
import '../../core/utils/base_status.dart';
import '../../core/constants/constants.dart';
import '../../core/utils/utils.dart';
import '../../core/bloc/theme/theme_bloc.dart';
import '../../core/bloc/confirmation/confirmation_bloc.dart';
import '../../core/bloc/auth/auth_user/auth_bloc.dart';
import '../../core/constants/bamba_routes.dart';

import 'components/confirmation_content.dart';

class ConfirmationView extends StatefulWidget {
  const ConfirmationView({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);
  final String? phoneNumber;

  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> {
  ConfirmationBloc? _confirmationBloc;
  AuthBloc? _authBloc;

  static const maxSeconds = 30;
  Duration duration = const Duration();
  Timer? timer;
  int seconds = maxSeconds;
  bool canSendCode = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    _confirmationBloc = context.read<ConfirmationBloc>();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startTimer() {
    seconds = maxSeconds;

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (seconds > 0) {
          setState(() => seconds--);
          duration = Duration(seconds: seconds);
        } else {
          stopTimer();
          setState(
            () {
              canSendCode = true;
            },
          );
        }
      },
    );
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<ConfirmationBloc, ConfirmationState>(
              buildWhen: (previousState, newState) {
                Utils.onFocusScope(context, newState);

                if (newState.theCodeIsValid == false) {
                  Utils.showSnackBar(
                    context: context,
                    message: Constants.digitLengthErrorText,
                  );
                }

                return true;
              },
              builder: (context, state) {
                switch (authState.status) {
                  case BaseStatus.initialized:
                  case BaseStatus.failed:
                  case BaseStatus.success:
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
                            cellphone: widget.phoneNumber,
                            pin: state.codeNumber,
                          ),
                        );
                        if (authState.status == BaseStatus.success) {
                          Navigator.of(context).pushReplacementNamed(
                            BambaRoutes.onBoarding,
                          );
                        }

                        if (authState.status == BaseStatus.failed) {
                          Utils.showSnackBar(
                            context: context,
                            message: authState.onErrorMessage,
                          );
                        }
                      },
                      sendPin: () {
                        _authBloc?.add(
                          SendPinEvent(cellphone: widget.phoneNumber),
                        );

                        if (authState.status == BaseStatus.success) {
                          startTimer();
                          canSendCode = false;
                          return false;
                        }
                      },
                      setTime: buildTime(),
                      isValid: state.theCodeIsValid,
                      focusSecondTrue: state.secondTextFieldFocus,
                      focusThirdTrue: state.thirdTextFieldFocus,
                      focusFourthTrue: state.fourthTextFieldFocus,
                      primaryColor: themeState.primaryColor as Color,
                      accentColor: themeState.accentColor as Color,
                      textColor: themeState.textColor as Color,
                      canSendCode: canSendCode,
                    );
                  case BaseStatus.onRequest:
                    return const ScreenLoadingLogo();
                  case BaseStatus.loading:
                    return const ScreenLoadingLogo();
                  case BaseStatus.uninitialized:
                    return const ScreenLoadingLogo();
                  default:
                    //TODO: create an error page
                    return Container();
                }
              },
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

  String buildTime() {
    String twoDigits(int digit) => digit.toString().padLeft(2, '0');

    final minutes = twoDigits(
      duration.inMinutes.remainder(60),
    );
    final seconds = twoDigits(
      duration.inSeconds.remainder(60),
    );

    return "$minutes:$seconds seg";
  }
}
