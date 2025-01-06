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

class IncrementDecrementProductCountState extends CartState {
  final int productCount;

  IncrementDecrementProductCountState({required this.productCount});
}
// class DecrementProductCountState extends CartState{}


