import 'package:flutter/material.dart';
import 'package:grocery_bloc_app/controller/CheckoutBloc/checkout_bloc.dart';
import 'package:grocery_bloc_app/controller/CheckoutBloc/checkout_event.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection(
      {super.key, required this.paymentMethod, required this.checkoutBloc});
  final String paymentMethod;
  final CheckoutBloc checkoutBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -3),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Payment Method:",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
          const SizedBox(height: 8),
          DropdownButton<String>(
            value: paymentMethod,
            dropdownColor: Colors.white,
            onChanged: (String? newValue) {
              checkoutBloc.add(CheckoutPaymentMethodEvent(newValue!));
            },
            items: checkoutBloc.paymentMethodList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
