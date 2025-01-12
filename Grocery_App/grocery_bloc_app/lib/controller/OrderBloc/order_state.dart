import 'package:grocery_bloc_app/model/order_details_model.dart';

abstract class OrderState {}

class OrderInitialState extends OrderState {}

class OrdersLoadingState extends OrderState {}

class OrdersLoadedSuccessState extends OrderState {
  final List<OrderDetails> ordersList;

  OrdersLoadedSuccessState({required this.ordersList});
}
