part of 'confirmation_bloc.dart';

class ConfirmationState extends Equatable {
  FocusNode secondTextFieldFocus = FocusNode();
  FocusNode thirdTextFieldFocus = FocusNode();
  FocusNode fourthTextFieldFocus = FocusNode();
  final String? firstDigit;
  final String? secondDigit;
  final String? thirdDigit;
  final String? fourthDigit;
  final String? codeTextError;
  final String? cellphone;
  final String? codeNumber;
  bool? theCodeIsValid;

  ConfirmationState({
    required this.secondTextFieldFocus,
    required this.thirdTextFieldFocus,
    required this.fourthTextFieldFocus,
    this.theCodeIsValid,
    this.firstDigit = '',
    this.secondDigit = '',
    this.thirdDigit = '',
    this.fourthDigit = '',
    this.codeTextError,
    this.cellphone,
    this.codeNumber,
  });

  ConfirmationState copyWith({
    FocusNode? secondTextFieldFocus,
    FocusNode? thirdTextFieldFocus,
    FocusNode? fourthTextFieldFocus,
    String? firstDigit,
    String? secondDigit,
    String? thirdDigit,
    String? fourthDigit,
    String? codeTextError,
    String? cellphone,
    String? codeNumber,
    bool? theCodeIsValid,
  }) {
    return ConfirmationState(
      secondTextFieldFocus: secondTextFieldFocus ?? this.secondTextFieldFocus,
      thirdTextFieldFocus: thirdTextFieldFocus ?? this.thirdTextFieldFocus,
      fourthTextFieldFocus: fourthTextFieldFocus ?? this.fourthTextFieldFocus,
      firstDigit: firstDigit ?? this.firstDigit,
      secondDigit: secondDigit ?? this.secondDigit,
      thirdDigit: thirdDigit ?? this.thirdDigit,
      fourthDigit: fourthDigit ?? this.fourthDigit,
      codeTextError: codeTextError ?? this.codeTextError,
      cellphone: cellphone ?? this.cellphone,
      codeNumber: codeNumber ?? this.codeNumber,
      theCodeIsValid: theCodeIsValid ?? this.theCodeIsValid,
    );
  }

  @override
  List<Object?> get props => [
    secondTextFieldFocus,
    thirdTextFieldFocus,
    fourthTextFieldFocus,
    firstDigit,
    secondDigit,
    thirdDigit,
    fourthDigit,
    codeTextError,
    cellphone,
    codeNumber,
    theCodeIsValid,
  ];
}
