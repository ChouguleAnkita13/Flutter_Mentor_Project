import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_event.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_state.dart';
import 'package:grocery_bloc_app/controller/FirebaseData/firebase_addtocart_data.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernceData/session_data.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveProductFromCartEvent>(cartRemoveProductFromCartEvent);
    on<IncrementProductCountEvent>(incrementProductCountEvent);
    on<DecrementProductCountEvent>(decrementProductCountEvent);
    on<CartNavigateToCheckoutScreenEvent>(cartNavigateToCheckoutScreenEvent);
  }
  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    log('Emit CartLoadingState');

    emit(CartLoadingState());
    log('pause');

    await FirebaseAddtocartData.getCartListFromFirebase();
    log('Emit CartLoadedSuccessState');

    emit(CartLoadedSuccessState(products: FirebaseAddtocartData.cartItems));
  }

  FutureOr<void> cartRemoveProductFromCartEvent(
      CartRemoveProductFromCartEvent event, Emitter<CartState> emit) async {
    log('Remove Product from cart');

    final response = await FirebaseAddtocartData.removeDataFromFirebaseCartList(
        event.product);
    if (response) {
      ///To show List after removing items from cart
      emit(CartLoadedSuccessState(products: FirebaseAddtocartData.cartItems));

      emit(CartRemoveProductFromCartActionState(
          message: "${event.product.name} removed from Cart"));
    }
  }

  FutureOr<void> incrementProductCountEvent(
      IncrementProductCountEvent event, Emitter<CartState> emit) {
    log("Incrementing product count for ${event.product.name}");

    // Update the product's `numberOfItems`
    event.product.numberOfItems += 1;

    // Emit a state to refresh the cart view
    emit(CartLoadedSuccessState(products: FirebaseAddtocartData.cartItems));
  }

  FutureOr<void> decrementProductCountEvent(
      DecrementProductCountEvent event, Emitter<CartState> emit) {
    log("Decrementing product count for ${event.product.name}");

    if (event.product.numberOfItems > 1) {
      // Update the product's `numberOfItems`
      event.product.numberOfItems -= 1;

      // Emit a state to refresh the cart view
      emit(CartLoadedSuccessState(products: FirebaseAddtocartData.cartItems));
    } else {
      log("Cannot decrement below 1");
    }
  }

  FutureOr<void> cartNavigateToCheckoutScreenEvent(
      CartNavigateToCheckoutScreenEvent event, Emitter<CartState> emit) async {
    await SessionData.getSessionAddress();
    emit(CartNavigateToCheckoutScreenState(
        checkoutItems: event.checkoutItems,
        deliveryAddress: SessionData.address!,
        totalAmount: event.totalAmount));
  }
}
