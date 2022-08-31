part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final BaseStatus status;
  final String onErrorMessage;
  final BambaUser? user;

  const AuthState({
    this.status = BaseStatus.initialized,
    this.onErrorMessage = '',
    this.user,
  });

  AuthState copyWith({
    BaseStatus? status,
    String? onErrorMessage,
    BambaUser? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      onErrorMessage: onErrorMessage ?? this.onErrorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
    status,
    onErrorMessage,
    user,
  ];
}
