part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckIfIsLoggedInEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class AddUserLoggedEvent extends AuthEvent {
  final BambaUser user;

  AddUserLoggedEvent({required this.user});
}

class ValidateUserLoggingEvent extends AuthEvent {
  final String? cellphone;
  final String? pin;

  ValidateUserLoggingEvent({
    required this.pin,
    required this.cellphone,
  });
}

class SendPinEvent extends AuthEvent {
  final String? cellphone;
  SendPinEvent({required this.cellphone});
}
