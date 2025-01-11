import 'package:grocery_bloc_app/model/product_data_model.dart';

abstract class CartState {}

class CartActionState extends CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedSuccessState extends CartState {
  final List<ProductDataModel> products;
  CartLoadedSuccessState({
    required this.products,
  });
}

class CartRemoveProductFromCartActionState extends CartActionState {
  final String message;

  CartRemoveProductFromCartActionState({required this.message});
}

class CartNavigateToCheckoutScreenState extends CartActionState {
  final List<ProductDataModel> checkoutItems;
  final String deliveryAddress;
  final double totalAmount;

  CartNavigateToCheckoutScreenState(
      {required this.checkoutItems,
      required this.deliveryAddress,
      required this.totalAmount});
}
