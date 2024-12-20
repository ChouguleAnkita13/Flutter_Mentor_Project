import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc_app/controller/Data/items_list.dart';
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
  }

  ///Event Handler for WishlistInitialEvent
  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(WishlistSuccessState(products: wishlistItems));
  }

  ///Event Handler for WishlistRemoveItemFromWishlistEvent
  FutureOr<void> wishlistRemoveItemFromWishlistEvent(
      WishlistRemoveItemFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.product);

    ///This state is emitted/sent to remove item form wishlist
    emit(WishlistRemoveItemFromWishlistState());

    ///This state is emitted bcz once we remove item form wishlist, we get updated list again
    emit(WishlistSuccessState(products: wishlistItems));

    ///This state is emitted to show some action after item removed from wishlist
    emit(WishlistRemoveItemFromWishlistActionState());
  }
}
