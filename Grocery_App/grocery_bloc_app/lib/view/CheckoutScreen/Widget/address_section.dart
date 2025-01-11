import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  const AddressSection(
      {super.key, required this.deliveryAddressTextEditingController});

  final TextEditingController deliveryAddressTextEditingController;

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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Delivery Address:",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: deliveryAddressTextEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            cursorColor: Colors.black54,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
