import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_event.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_state.dart';
import 'package:grocery_bloc_app/controller/Data/items_list.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveProductFromCartEvent>(cartRemoveProductFromCartEvent);
  }
  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    log('Emit CartLoadingState');

    emit(CartLoadingState());
    log('pause');

    await Future.delayed(
      const Duration(seconds: 5),
    );
    log('Emit CartLoadedSuccessState');

    emit(CartLoadedSuccessState(products: cartItems));
  }

  FutureOr<void> cartRemoveProductFromCartEvent(
      CartRemoveProductFromCartEvent event, Emitter<CartState> emit) {
    log('Remove Product from cart');

    cartItems.remove(event.product);

    emit(CartRemoveProductFromCartState());

    ///To show List after removing items from cart
    emit(CartLoadedSuccessState(products: cartItems));

    emit(CartRemoveProductFromCartActionState());
  }
}
