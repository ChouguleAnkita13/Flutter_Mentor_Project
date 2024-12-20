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

class CartRemoveProductFromCartState extends CartState {}

class CartRemoveProductFromCartActionState extends CartActionState {}
