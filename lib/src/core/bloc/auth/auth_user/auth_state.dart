part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final BaseStatus status;
  final String onErrorMessage;
  final BambaUser? user;
  final String? phoneNumber;

  const AuthState({
    this.status = BaseStatus.initialized,
    this.onErrorMessage = '',
    this.user,
    this.phoneNumber,
  });

  AuthState copyWith({
    BaseStatus? status,
    String? onErrorMessage,
    String? phoneNumber,
    BambaUser? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      onErrorMessage: onErrorMessage ?? this.onErrorMessage,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
    status,
    onErrorMessage,
    phoneNumber,
    user,
  ];
}
