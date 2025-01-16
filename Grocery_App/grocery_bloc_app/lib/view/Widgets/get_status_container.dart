import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStatusContainer {
  static Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return const Color.fromRGBO(14, 161, 125, 1);
      case 'Being Packed':
        return Colors.orange;
      case 'Out for Delivery':
        return const Color.fromRGBO(14, 161, 125, 0.5);
      case 'Cancelled':
        return Colors.red;
      case 'Cancel Order':
        return Colors.red;
      default:
        return Colors.blue[200]!;
    }
  }

  static Container getStatusContainer(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: _getStatusColor(status),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
