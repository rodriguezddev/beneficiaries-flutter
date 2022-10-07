part of 'confirmation_bloc.dart';

abstract class ConfirmationEvent {}

class GetFirstDigitEvent extends ConfirmationEvent {
  final String firstDigit;
  dynamic context;

  GetFirstDigitEvent({
    required this.firstDigit,
    this.context,
  });
}

class GetSecondDigitEvent extends ConfirmationEvent {
  final String secondDigit;
  dynamic context;

  GetSecondDigitEvent({
    required this.secondDigit,
    this.context,
  });
}

class GetThirdDigitEvent extends ConfirmationEvent {
  final String thirdDigit;
  dynamic context;

  GetThirdDigitEvent({
    required this.thirdDigit,
    this.context,
  });
}

class GetFourthDigitEvent extends ConfirmationEvent {
  final String? firstDigit;
  final String? secondDigit;
  final String? thirdDigit;
  final String? fourthDigit;
  dynamic context;

  GetFourthDigitEvent({
    required this.firstDigit,
    required this.secondDigit,
    required this.fourthDigit,
    required this.thirdDigit,
    this.context,
  });
}

class ValidCodeEvent extends ConfirmationEvent {
  final String? codeNumber;

  ValidCodeEvent({
    required this.codeNumber,
  });
}

