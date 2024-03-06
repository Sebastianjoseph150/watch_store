part of 'navbar_bloc.dart';

@immutable
sealed class NavbarEvent {}

class ButtonPressedEvent extends NavbarEvent {
  int index;
  ButtonPressedEvent({required this.index});
}
