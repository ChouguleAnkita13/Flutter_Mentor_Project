abstract class CheckoutState {}

class CheckoutInitialState extends CheckoutState {}

class CheckoutActionState extends CheckoutState {}

class CheckoutPaymentMethodState extends CheckoutState {
  final String paymentMethod;
  final String deliveryTime;

  CheckoutPaymentMethodState({
    required this.paymentMethod,
    required this.deliveryTime,
  });
}

class CheckoutButtonPlaceOrderDialogState extends CheckoutActionState {}

class CheckoutDoneButtonState extends CheckoutActionState {}
