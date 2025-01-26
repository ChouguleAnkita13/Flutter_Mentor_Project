abstract class CheckoutState {}

class CheckoutInitialState extends CheckoutState {}

class CheckoutActionState extends CheckoutState {}

class CheckoutPaymentMethodState extends CheckoutState {
  final String paymentMethod;
  CheckoutPaymentMethodState({
    required this.paymentMethod,
  });
}

class CheckoutButtonPlaceOrderDialogState extends CheckoutActionState {}

class CheckoutButtonEnterAddressSnackbarState extends CheckoutActionState {
  final String message;

  CheckoutButtonEnterAddressSnackbarState({required this.message});
}

class CheckoutDoneButtonState extends CheckoutActionState {}
