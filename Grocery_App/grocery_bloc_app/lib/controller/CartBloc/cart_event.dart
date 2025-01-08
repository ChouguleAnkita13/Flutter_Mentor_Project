import 'package:grocery_bloc_app/model/product_data_model.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveProductFromCartEvent extends CartEvent {
  final ProductDataModel product;
  CartRemoveProductFromCartEvent({required this.product});
}

class IncrementProductCountEvent extends CartEvent {
  final ProductDataModel product;

  IncrementProductCountEvent({required this.product});
}

class DecrementProductCountEvent extends CartEvent {
  final ProductDataModel product;

  DecrementProductCountEvent({required this.product});
}
