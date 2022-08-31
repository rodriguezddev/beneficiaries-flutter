part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckIfIsLoggedInEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class AddUserLoggedEvent extends AuthEvent {
  final BambaUser user;
  AddUserLoggedEvent({required this.user});
}