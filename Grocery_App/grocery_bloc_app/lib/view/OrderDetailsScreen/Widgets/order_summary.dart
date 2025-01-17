import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/model/order_details_model.dart';
import 'package:grocery_bloc_app/view/Widgets/get_status_container.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.orderDetails,
  });
  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Order ID:", orderDetails.id),
          const SizedBox(height: 5),
          _buildInfoRow(
            "Order Date:",
            orderDetails.orderPlacedTime,
          ),
          const SizedBox(height: 5),
          _buildInfoRow(
            "Delivery Date:",
            orderDetails.dateTime,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Status:",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              Row(
                children: [
                  GetStatusContainer.getStatusContainer(orderDetails.status),
                  const SizedBox(width: 10),
                  (orderDetails.status != "Delivered")
                      ? GetStatusContainer.getStatusContainer("Cancel Order")
                      : const SizedBox()
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  static Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
