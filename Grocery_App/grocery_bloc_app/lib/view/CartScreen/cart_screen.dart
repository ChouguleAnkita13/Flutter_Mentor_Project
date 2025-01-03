import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_bloc.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_event.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_state.dart';
import 'package:grocery_bloc_app/view/CartScreen/cart_tile_widget.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_snackbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        log("------In listener");

        if (state is CartRemoveProductFromCartActionState) {
          log("------In Snackbar RemoveCartActionState");
          CustomSnackbar.customSnackbar(context, state.message);
        }
      },
      builder: (context, state) {
        log("------In builder");

        switch (state.runtimeType) {
          case const (CartLoadingState):
            log("------In Case LoadingState");
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case const (CartLoadedSuccessState):
            log("------In Case SuccessState");

            final successState = state as CartLoadedSuccessState;
            return Scaffold(
              appBar: CustomAppbar.customAppbar("My Cart"),
              backgroundColor: Colors.white,
              body: successState.products.isEmpty
                  ? const Center(child: Text("No Items In Cart"))
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 15),
                      child: ListView.separated(
                        itemCount: successState.products.length,
                        itemBuilder: (context, index) {
                          return CartTileWidget(
                              cartBloc: cartBloc,
                              productDataModel: successState.products[index]);
                        },
                        separatorBuilder: (context, idx) => Divider(
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
