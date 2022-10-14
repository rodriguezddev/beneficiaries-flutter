part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String onErrorMessage;
  final bool isLoading;
  final bool phoneNumberValid;
  final String? phoneTextError;
  final String? phoneNumber;

  const RegisterState({
    this.onErrorMessage = '',
    this.isLoading = false,
    this.phoneNumberValid = false,
    this.phoneTextError = '',
    this.phoneNumber,
  });

  RegisterState copyWith({
    String? onErrorMessage,
    bool? isLoading,
    bool? phoneNumberValid,
    String? phoneTextError,
    String? phoneNumber,
  }) {
    return RegisterState(
      onErrorMessage: onErrorMessage ?? this.onErrorMessage,
      isLoading: isLoading ?? this.isLoading,
      phoneNumberValid: phoneNumberValid ?? this.phoneNumberValid,
      phoneTextError: phoneTextError ?? this.phoneTextError,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    phoneNumberValid,
    phoneTextError,
    phoneNumber,
  ];
}
