import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_order_data.dart';
import 'package:grocery_bloc_app/controller/OrderBloc/order_event.dart';
import 'package:grocery_bloc_app/controller/OrderBloc/order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitialState()) {
    on<OrderInitialEvent>(orderInitialEvent);
  }

  FutureOr<void> orderInitialEvent(
      OrderInitialEvent event, Emitter<OrderState> emit) async {
    emit(OrdersLoadingState());
    await FirebaseOrderData.getOrderListFromFirebase();
    emit(OrdersLoadedSuccessState(ordersList: FirebaseOrderData.ordersList));
  }
}
