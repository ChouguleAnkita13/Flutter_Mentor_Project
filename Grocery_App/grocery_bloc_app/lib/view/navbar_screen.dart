import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/NavbarBloc/navbar_bloc.dart';
import 'package:grocery_bloc_app/controller/NavbarBloc/navbar_event.dart';
import 'package:grocery_bloc_app/controller/NavbarBloc/navbar_state.dart';

class NavbarScreen extends StatelessWidget {
  final int selectedIndex;

  const NavbarScreen({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavbarBloc()
        ..add(ChangeBottomNavTapEvent(
            newIndex: selectedIndex)), // Set initial index
      child: const NavbarView(),
    );
  }
}

class NavbarView extends StatelessWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: (context, state) {
        if (state is ChangeBottomNavTapState) {
          return Scaffold(
            body: state.currentScreen,
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (index) {
                context
                    .read<NavbarBloc>()
                    .add(ChangeBottomNavTapEvent(newIndex: index));
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedLabelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              selectedItemColor: const Color.fromRGBO(14, 161, 125, 1),
              unselectedItemColor: Colors.black,
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.auto_awesome_mosaic_outlined),
                  label: "Explore",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: "Favourite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "Profile",
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
