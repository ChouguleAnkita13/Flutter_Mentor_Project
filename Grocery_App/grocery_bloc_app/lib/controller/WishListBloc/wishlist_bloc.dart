import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_addtocart_data.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_wishlist_data.dart';
import 'package:grocery_bloc_app/controller/WishListBloc/wishlist_event.dart';
import 'package:grocery_bloc_app/controller/WishListBloc/wishlist_state.dart';

/// A Bloc class for managing Wishlist states and events.

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  // WishlistBloc(super.initialState);
  /// Constructor initializes the WishlistBloc with the WishlistInitial state.

  WishlistBloc() : super(WishlistInitialState()) {
    ///Registering Event Handlers
    /// A [StateError] will be thrown if there are multiple event handlers registered for the same type Event.
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveItemFromWishlistEvent>(
        wishlistRemoveItemFromWishlistEvent);
    on<WishlistAddAllToCartButtonClickedEvent>(
        wishlistAddAllToCartButtonClickedEvent);
  }

  ///Event Handler for WishlistInitialEvent
  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());
    await FirebaseWishlistData.getWishlistFromFirebase();
    emit(WishlistSuccessState(products: FirebaseWishlistData.wishlistItems));
  }

  ///Event Handler for WishlistRemoveItemFromWishlistEvent
  FutureOr<void> wishlistRemoveItemFromWishlistEvent(
      WishlistRemoveItemFromWishlistEvent event,
      Emitter<WishlistState> emit) async {
    final bool response =
        await FirebaseWishlistData.removeDataFromFirebaseWishList(
            event.product);

    if (response) {
      ///This state is emitted bcz once we remove item form wishlist, we get updated list again
      ///
      emit(WishlistSuccessState(products: FirebaseWishlistData.wishlistItems));

      ///This state is emitted to show some action after item removed from wishlist
      emit(WishlistRemoveItemFromWishlistActionState(
          message: "${event.product.name} removed from wishlist"));
    }
  }

  FutureOr<void> wishlistAddAllToCartButtonClickedEvent(
      WishlistAddAllToCartButtonClickedEvent event,
      Emitter<WishlistState> emit) async {
    final bool response =
        await FirebaseAddtocartData.addWishListToFirebaseCartList(
            event.wishlistItems);

    if (response) {
      ///This state is emitted to show some action after items add to cart
      if (event.wishlistItems.length == 1) {
        emit(WishlistAllAddToCartActionState(message: "Item Added in cart"));
      } else {
        emit(WishlistAllAddToCartActionState(
            message: "All Items Added in cart"));
      }
    } else {
      ///This state is emitted to show some action after item add to cart
      if (event.wishlistItems.length == 1) {
        emit(WishlistAllAddToCartActionState(
            message: "Item Already Added in cart"));
      } else {
        emit(WishlistAllAddToCartActionState(
            message: "All Items Already Added in cart"));
      }
    }
  }
}
