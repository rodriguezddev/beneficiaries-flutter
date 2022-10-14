part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class GetPhoneEvent extends RegisterEvent {
  final String cellphone;
  GetPhoneEvent({required this.cellphone});
}
