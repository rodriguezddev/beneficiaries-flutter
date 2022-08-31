part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {
  final String userId;
  GetProfileEvent({required this.userId});
}

class EditProfileEvent extends ProfileEvent {
  final String userId;
  EditProfileEvent({required this.userId});
}