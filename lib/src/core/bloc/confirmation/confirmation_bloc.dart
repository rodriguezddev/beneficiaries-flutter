import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  ConfirmationBloc()
    : super(ConfirmationState(
      secondTextFieldFocus: FocusNode(),
      thirdTextFieldFocus: FocusNode(),
      fourthTextFieldFocus: FocusNode(),
    )) {
    on<GetFirstDigitEvent>(_mapGetFirstDigitEvent);
    on<GetSecondDigitEvent>(_mapGetSecondDigitEvent);
    on<GetThirdDigitEvent>(_mapGetThirdDigitEvent);
    on<GetFourthDigitEvent>(_mapGetFourthDigitEvent);
  }

  Future<void> _mapGetFirstDigitEvent(
    GetFirstDigitEvent event,
    Emitter<ConfirmationState> emit,
  ) async {
    emit(
      state.copyWith(
        firstDigit: event.firstDigit,
      ),
    );
  }

  Future<void> _mapGetSecondDigitEvent(
    GetSecondDigitEvent event,
    Emitter<ConfirmationState> emit,
  ) async {
    emit(
      state.copyWith(
        secondDigit: event.secondDigit,
      ),
    );
  }

  Future<void> _mapGetThirdDigitEvent(
    GetThirdDigitEvent event,
    Emitter<ConfirmationState> emit,
  ) async {
    emit(
      state.copyWith(
        thirdDigit: event.thirdDigit,
      ),
    );
  }

  Future<void> _mapGetFourthDigitEvent(
    GetFourthDigitEvent event,
    Emitter<ConfirmationState> emit,
  ) async {
    final code =
        '${event.firstDigit}${event.secondDigit}${event.thirdDigit}${event.fourthDigit}';

    if (code.length == 4) {
      emit(
        state.copyWith(codeNumber: code, theCodeIsValid: true),
      );
    }
    emit(
      state.copyWith(theCodeIsValid: false),
    );
  }
}
