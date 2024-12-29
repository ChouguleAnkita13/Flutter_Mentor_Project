import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:grocery_bloc_app/controller/Data/items_list.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_data.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
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
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    log('Wishlist Product Clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    log('Cart Product clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
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
}
