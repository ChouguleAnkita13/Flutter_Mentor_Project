// part of 'home_bloc.dart';

import 'package:grocery_bloc_app/model/product_data_model.dart';

// @immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeAddToCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeAddToCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeExploreProductButtonClickedEvent extends HomeEvent {
  final List<ProductDataModel> clickedProduct;
  final String category;
  HomeExploreProductButtonClickedEvent({
    required this.clickedProduct,
    required this.category,
  });
}

class HomeProductDetailsClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductDetailsClickedEvent({
    required this.clickedProduct,
  });
}

class HomeNotificationButtonNavigateEvent extends HomeEvent {}

class HomeSeeAllButtonNavigateEvent extends HomeEvent {}
