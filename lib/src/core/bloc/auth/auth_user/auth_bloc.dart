import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/base_status.dart';
import '../../../repositories/customer_repository.dart';
import '../../../models/user/bamba_user.dart';
import '../../../constants/constants.dart';
import '../../../models/confirmation/confirmartion_requets.dart';
import '../../../utils/utils.dart';
import '../../../models/register/register_requets.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final repository = CustomerRepository();

  AuthBloc(AuthState initialState) : super(initialState) {
    on<CheckIfIsLoggedInEvent>(_mapValidateLoggedUser);

    on<AddUserLoggedEvent>(_mapAddUserLoggedEventToState);

    on<LogoutEvent>(_mapOnLogOutEventToState);

    on<ValidateUserLoggingEvent>(_mapValidateUserLoggingEventToState);

    on<SendPinEvent>(_mapSendPinEventToState);
  }

  void _mapAddUserLoggedEventToState(
    AddUserLoggedEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        status: BaseStatus.authenticated,
        user: event.user,
      ),
    );
  }

  void _mapOnLogOutEventToState(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(status: BaseStatus.unauthenticated),
    );
  }

  void _mapValidateLoggedUser(
    AuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(status: BaseStatus.loading),
    );

    const isLogged = true; //TODO: validate auth
    if (!isLogged) {
      emit(
        state.copyWith(
          status: BaseStatus.unauthenticated,
        ),
      );
      return;
    }

    final user = BambaUser(); //TODO: Get user from utils
    user.email = 'miguel.osorio@vivebamba.com';
    user.name = 'Mike Test';
    user.bambaBalance = "100.00";

    emit(
      state.copyWith(
        status: BaseStatus.authenticated,
        user: user,
      ),
    );
  }

  void _mapSendPinEventToState(
    SendPinEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(status: BaseStatus.onRequest),
    );
    try {
      final cellphone = event.cellphone;
      SendPinRequest sendPinData = SendPinRequest();
      sendPinData.cellphone = cellphone;
      String? token = Utils.getToken();
      await repository!.sendPin(
        token,
        sendPinData.toJson(),
      );

      emit(
        state.copyWith(
          status: BaseStatus.success,
          phoneNumber: cellphone,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: BaseStatus.failed,
          onErrorMessage: Constants.validationErrorText,
        ),
      );
    }
  }

  void _mapValidateUserLoggingEventToState(
    ValidateUserLoggingEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(status: BaseStatus.onRequest),
    );

    try {
      final cellphone = event.cellphone;
      final pin = event.pin;
      PinValidatorRequest pinValidatorData = PinValidatorRequest();
      pinValidatorData.cellphone = cellphone;
      pinValidatorData.pin = pin;
      String? token = Utils.getToken();

      final response = await repository!.login(
        token,
        pinValidatorData.toJson(),
      );
      Utils.saveUserPrefs(response);

      emit(
        state.copyWith(
          status: BaseStatus.success,
          user: response,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: BaseStatus.failed,
          onErrorMessage: Constants.validationErrorText,
        ),
      );
    }
  }
}
