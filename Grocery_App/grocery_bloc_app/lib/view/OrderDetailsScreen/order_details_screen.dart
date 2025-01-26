import 'package:flutter/material.dart';
import 'package:grocery_bloc_app/model/order_details_model.dart';
import 'package:grocery_bloc_app/view/CheckoutScreen/Widget/item_tile.dart';
import 'package:grocery_bloc_app/view/CheckoutScreen/Widget/total_amount.dart';
import 'package:grocery_bloc_app/view/OrderDetailsScreen/Widgets/delivery_address.dart';
import 'package:grocery_bloc_app/view/OrderDetailsScreen/Widgets/order_summary.dart';
import 'package:grocery_bloc_app/view/OrderDetailsScreen/Widgets/payment_method.dart';
import 'package:grocery_bloc_app/view/OrderDetailsScreen/Widgets/section_title.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderDetails orderDetails;

  const OrderDetailsPage({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.customAppbar("Order Details"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// ORDER SUMMARY SECTION
            const SectionTitle(title: "Order Summary"),
            OrderSummary(orderDetails: orderDetails),

            /// ITEMS SECTION
            const SectionTitle(title: "Items"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.2,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: orderDetails.items.length,
                itemBuilder: (context, index) {
                  final item = orderDetails.items[index];
                  return ItemTile(item: item);
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
              ),
            ),
            const SizedBox(height: 10),

            /// DELIVERY ADDRESS SECTION
            const SectionTitle(title: "Delivery Address"),

            DeliveryAddress(deliveryAddress: orderDetails.deliveryAddress),

            /// PAYMENT METHOD SECTION
            const SectionTitle(title: "Payment Method"),

            PaymentMethod(
              paymentMethod: orderDetails.paymentMethod,
            ),

            /// ORDER TOTAL SECTION
            const SectionTitle(title: "Order Total"),
            TotalAmount(totalAmount: orderDetails.totalAmount)
          ],
        ),
      ),
    );
  }
}
