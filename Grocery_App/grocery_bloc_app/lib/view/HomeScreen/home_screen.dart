import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_state.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';
import 'package:grocery_bloc_app/view/CartScreen/cart_screen.dart';
import 'package:grocery_bloc_app/view/HomeScreen/product_tile_widget.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/custom_textfield.dart';
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
                backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                toolbarHeight: 150,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                            child: Icon(
                          Icons.person,
                          color: Color.fromRGBO(14, 161, 125, 1),
                        )),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Hi, ${SessionData.username}',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: CustomTextfield(
                        title: "Search",
                        textcontroller: TextEditingController(),
                      ),
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60.0),
                  child: Transform.translate(
                    offset: const Offset(0, 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/veggie.png",
                        height: 100,
                        width: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                actions: [
                  // IconButton(
                  //     onPressed: () {
                  //       homeBloc.add(HomeWishlistButtonNavigateEvent());
                  //     },
                  //     icon: const Icon(Icons.favorite_border)),
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
