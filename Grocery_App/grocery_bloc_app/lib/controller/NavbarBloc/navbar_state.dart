import 'package:flutter/material.dart';

abstract class NavbarState {}

class NavbarInitialState extends NavbarState {}

class ChangeBottomNavTapState extends NavbarState {
  final int currentIndex;
  final Widget currentScreen;

  ChangeBottomNavTapState(this.currentIndex, this.currentScreen);
}
