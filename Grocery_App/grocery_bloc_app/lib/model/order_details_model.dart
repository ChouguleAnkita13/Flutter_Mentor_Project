import 'package:grocery_bloc_app/model/product_data_model.dart';

class OrderDetails {
  final String id;
  final String dateTime;
  final String status;
  final String deliveryAddress;
  final String paymentMethod;
  final double totalAmount;
  final List<ProductDataModel> items;

  OrderDetails({
    required this.id,
    required this.dateTime,
    required this.status,
    required this.deliveryAddress,
    required this.paymentMethod,
    required this.totalAmount,
    required this.items,
  });
}
