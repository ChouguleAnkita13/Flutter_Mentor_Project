import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:grocery_bloc_app/controller/Firebase/firebase_addtocart_data.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_data.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_wishlist_data.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeAddToCartButtonClickedEvent>(homeAddToCartButtonClickedEvent);

    on<HomeNotificationButtonNavigateEvent>(
        homeNotificationButtonNavigateEvent);
    on<HomeSeeAllButtonNavigateEvent>(homeSeeAllButtonNavigateEvent);
    on<HomeExploreProductButtonClickedEvent>(
        homeExploreProductButtonClickedEvent);
    on<HomeProductDetailsClickedEvent>(homeProductDetailsClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    // await Future.delayed(const Duration(seconds: 3));

    ///
    await FirebaseData.getGroceryDataFromFirebase();
    emit(HomeLoadedSuccessState(products: FirebaseData.groceryProduct));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event,
      Emitter<HomeState> emit) async {
    final bool response =
        await FirebaseWishlistData.addAndRemoveProductToFirebaseWishList(
            event.clickedProduct);

    if (response) {
      ///This state is emitted bcz once we remove or add item form wishlist, we get updated list again
      emit(HomeLoadedSuccessState(products: FirebaseData.groceryProduct));
      emit(HomeProductItemWishlistedActionState(
          message: "${event.clickedProduct.name} added in wishlist"));
    } else {
      ///This state is emitted bcz once we remove or add item form wishlist, we get updated list again
      emit(HomeLoadedSuccessState(products: FirebaseData.groceryProduct));

      emit(HomeProductRemovedFromWishlistActionState(
          message: "${event.clickedProduct.name} removed from wishlist"));
    }
  }

  ///EVENT HANDLER FOR ADD REMOVE CART ITEM FROM FIREBASE FOR HomeProductCartButtonClickedEvent
  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) async {
    log('Cart Product clicked');
    final response =
        await FirebaseAddtocartData.addAndRemoveProductToFirebaseCartList(
            event.clickedProduct);
    if (response) {
      ///This state is emitted bcz once we remove or add item form wishlist, we get updated list again
      emit(HomeLoadedSuccessState(products: FirebaseData.groceryProduct));
      emit(HomeProductItemCartedActionState(
          message: "${event.clickedProduct.name} added to cart"));
    } else {
      ///This state is emitted bcz once we remove or add item form wishlist, we get updated list again
      emit(HomeLoadedSuccessState(products: FirebaseData.groceryProduct));
      emit(HomeProductRemoveFromCartActionState(
          message: "${event.clickedProduct.name} removed from cart"));
    }
  }

  FutureOr<void> homeNotificationButtonNavigateEvent(
      HomeNotificationButtonNavigateEvent event, Emitter<HomeState> emit) {
    log('Notification Navigate clicked');
    emit(HomeNavigateToNotificationPageActionState());
  }

  FutureOr<void> homeSeeAllButtonNavigateEvent(
      HomeSeeAllButtonNavigateEvent event, Emitter<HomeState> emit) {
    log('See Navigate clicked');
    emit(HomeNavigateToExploreSeeAllActionState());
  }

  FutureOr<void> homeExploreProductButtonClickedEvent(
      HomeExploreProductButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToExploreProductsActionState(
        products: event.clickedProduct, category: event.category));
  }

  FutureOr<void> homeProductDetailsClickedEvent(
      HomeProductDetailsClickedEvent event, Emitter<HomeState> emit) {
    emit(
        HomeNavigateToProductDetailsActionState(product: event.clickedProduct));
  }

  FutureOr<void> homeAddToCartButtonClickedEvent(
      HomeAddToCartButtonClickedEvent event, Emitter<HomeState> emit) async {
    final response = await FirebaseAddtocartData.addDataToFirebaseCartList(
        event.clickedProduct);
    if (response) {
      emit(HomeProductItemCartedActionState(
          message: "${event.clickedProduct.name} added to cart"));
    } else {
      emit(HomeProductItemCartedActionState(
          message: "${event.clickedProduct.name} already added in cart"));
    }
  }
}
