import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(pageController: PageController())) {
    on<SetPageIndexEvent>(_mapSetPageIndexEventToState);
    on<ResetEvent>(_mapResetEventToState);
    on<OnItemTappedEvent>(_mapOnItemTappedEvent);
  }

  void _mapSetPageIndexEventToState(
    SetPageIndexEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(pageIndex: event.index),
    );
  }

  void _mapResetEventToState(
    ResetEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(pageIndex: 1),
    );
  }

  void _mapOnItemTappedEvent(
    OnItemTappedEvent event,
    Emitter<HomeState> emit,
  ) {
    void jumpToPage(PageController pageController) =>
        pageController.jumpToPage(event.index);
    emit(
      state.copyWith(
        pageIndex: event.index,
        pageController: jumpToPage,
      ),
    );
  }
}
