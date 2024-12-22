import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_state.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';
import 'package:grocery_bloc_app/view/CartScreen/cart_screen.dart';
import 'package:grocery_bloc_app/view/HomeScreen/product_tile_widget.dart';
import 'package:grocery_bloc_app/view/WishlistScreen/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishlistScreen()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Wishlisted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case const (HomeLoadedSuccessState):
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                toolbarHeight: 100,
                title:
                    Text('Hi ${SessionData.username},\nWelcome to Grocery App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        homeBloc: homeBloc,
                        productDataModel: successState.products[index]);
                  }),
            );

          case const (HomeErrorState):
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
