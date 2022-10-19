part of 'home_bloc.dart';

abstract class HomeEvent {}

class SetPageIndexEvent extends HomeEvent {
  final int index;
  SetPageIndexEvent({required this.index});
}

class ResetEvent extends HomeEvent {
  ResetEvent();
}

class OnItemTappedEvent extends HomeEvent {
  final int index;
  OnItemTappedEvent({required this.index});
}
