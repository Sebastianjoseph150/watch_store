part of 'navbar_bloc.dart';

@immutable
sealed class NavbarState {}

class NavbarInitial extends NavbarState {}

class ScreenChangedState extends NavbarState {
  final int index;
  
  ScreenChangedState({required this.index});
}
