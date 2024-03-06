import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial()) {
    on<ButtonPressedEvent>(buttonPressedEvent);
  }

  FutureOr<void> buttonPressedEvent(
      ButtonPressedEvent event, Emitter<NavbarState> emit) {
    print(event.index);
    emit(ScreenChangedState(index: event.index));
  }
}
