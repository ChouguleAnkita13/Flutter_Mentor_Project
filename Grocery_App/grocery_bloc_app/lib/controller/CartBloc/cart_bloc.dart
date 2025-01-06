import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_event.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_state.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_addtocart_data.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveProductFromCartEvent>(cartRemoveProductFromCartEvent);
    on<IncrementProductCountEvent>(incrementProductCountEvent);
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

  int count = 1;
  FutureOr<void> incrementProductCountEvent(
      IncrementProductCountEvent event, Emitter<CartState> emit) {
    count = count + 1;
    emit(IncrementDecrementProductCountState(productCount: count));
  }
}
