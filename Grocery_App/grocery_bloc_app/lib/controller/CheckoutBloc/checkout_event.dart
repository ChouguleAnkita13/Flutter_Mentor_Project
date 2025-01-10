import 'package:grocery_bloc_app/model/product_data_model.dart';

abstract class CheckoutEvent {}

class CheckoutInitialEvent extends CheckoutEvent {}

class CheckoutPaymentMethodEvent extends CheckoutEvent {
  final String paymentMethod;

  CheckoutPaymentMethodEvent(this.paymentMethod);
}

class CheckoutButtonEvent extends CheckoutEvent {
  final List<ProductDataModel> checkoutItems;
  final String deliveryAddress;
  final double totalAmount;
  final String paymentMethod;
  final String deliveryTime;

  CheckoutButtonEvent(
      {required this.checkoutItems,
      required this.deliveryAddress,
      required this.totalAmount,
      required this.paymentMethod,
      required this.deliveryTime});
}

class CheckoutNavigateToNavbarDoneButtonEvent extends CheckoutEvent {}
