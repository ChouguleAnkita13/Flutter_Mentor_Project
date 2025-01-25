import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/CheckoutBloc/checkout_event.dart';
import 'package:grocery_bloc_app/controller/CheckoutBloc/checkout_state.dart';
import 'package:grocery_bloc_app/controller/FirebaseData/firebase_order_data.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernceData/session_data.dart';
import 'package:intl/intl.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitialState()) {
    on<CheckoutInitialEvent>(checkoutInitialEvent);
    on<CheckoutButtonEvent>(checkoutButtonEvent);
    on<CheckoutPaymentMethodEvent>(checkoutPaymentMethodEvent);
    on<CheckoutNavigateToNavbarDoneButtonEvent>(
        checkoutNavigateToNavbarDoneButtonEvent);
  }
  final TextEditingController deliveryAddressTextEditingController =
      TextEditingController();
  final String deliveryTime = _calculateEstimatedDeliveryTime();
  final List<String> paymentMethodList = [
    'Credit/Debit Card',
    'Cash on Delivery',
    'PayPal',
  ];

  FutureOr<void> checkoutInitialEvent(
      CheckoutInitialEvent event, Emitter<CheckoutState> emit) {
    deliveryAddressTextEditingController.text = SessionData.address!;
    emit(CheckoutPaymentMethodState(
      paymentMethod: "Credit/Debit Card",
    ));
  }

  static String _calculateEstimatedDeliveryTime() {
    final now = DateTime.now();
    final estimatedTime = now.add(const Duration(minutes: 10));
    return DateFormat('d MMM yyyy,h:mm a').format(estimatedTime);
  }

  FutureOr<void> checkoutPaymentMethodEvent(
      CheckoutPaymentMethodEvent event, Emitter<CheckoutState> emit) {
    emit(CheckoutPaymentMethodState(
      paymentMethod: event.paymentMethod,
    ));
  }

  FutureOr<void> checkoutButtonEvent(
      CheckoutButtonEvent event, Emitter<CheckoutState> emit) async {
    ///COVERTING THE LIST OF PRODUCTDATAMODEL INTO LIST OF MAP
    List<Map<String, dynamic>> orderItemList = List.generate(
        event.checkoutItems.length,
        (index) => event.checkoutItems[index].productDataModelMap());

    Map<String, dynamic> orderMap = {
      "orderItemList": orderItemList,
      "orderPlacedTime": DateTime.now().toString(),
      "paymentMethod": event.paymentMethod,
      "deliveryAddress": event.deliveryAddress,
      "deliveryTime": event.deliveryTime,
      "totalAmount": event.totalAmount
    };
    await FirebaseOrderData.addOrderToFirebase(orderMap);
    emit(CheckoutButtonPlaceOrderDialogState());
  }

  FutureOr<void> checkoutNavigateToNavbarDoneButtonEvent(
      CheckoutNavigateToNavbarDoneButtonEvent event,
      Emitter<CheckoutState> emit) {
    emit(CheckoutDoneButtonState());
  }
}
