import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../constants/constants.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<GetPhoneEvent>(_mapGetPhoneEventToState);
  }

  void _mapGetPhoneEventToState(
    GetPhoneEvent event,
    Emitter<RegisterState> emit,
  ) async {
    final cellphone = event.cellphone;
    if (cellphone.length < 10) {
      bool phoneNumberValid = false;

      emit(
        state.copyWith(
          phoneNumberValid: phoneNumberValid,
          phoneTextError: Constants.phoneErrorText,
        ),
      );
    } else {
      emit(
        state.copyWith(
          phoneNumberValid: true,
          phoneTextError: null,
          phoneNumber: cellphone,
        ),
      );
    }
  }
}
