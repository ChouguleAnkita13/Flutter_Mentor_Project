import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery_bloc_app/controller/NavbarBloc/navbar_event.dart';
import 'package:grocery_bloc_app/controller/NavbarBloc/navbar_state.dart';
import 'package:grocery_bloc_app/view/CartScreen/cart_screen.dart';
import 'package:grocery_bloc_app/view/ExploreScreen/explore_screen.dart';
import 'package:grocery_bloc_app/view/HomeScreen/home_screen.dart';
import 'package:grocery_bloc_app/view/ProfileScreen/profile_screen.dart';
import 'package:grocery_bloc_app/view/WishlistScreen/wishlist_screen.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitialState()) {
    on<ChangeBottomNavTapEvent>(changeBottomNavTapEvent);
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const WishlistScreen(),
    const ProfileScreen()
  ];

  FutureOr<void> changeBottomNavTapEvent(
      ChangeBottomNavTapEvent event, Emitter<NavbarState> emit) {
    emit(ChangeBottomNavTapState(
        event.newIndex, _screens.elementAt(event.newIndex)));
  }
}
