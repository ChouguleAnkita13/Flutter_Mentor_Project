import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/CheckoutBloc/checkout_event.dart';
import 'package:grocery_bloc_app/view/Widgets/button_container.dart';
import 'package:grocery_bloc_app/controller/CheckoutBloc/checkout_bloc.dart';

class PlaceOrderDialog {
  static void showPlaceOrderDialog(
      BuildContext context, CheckoutBloc checkoutBloc) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog dismissal by tapping outside
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Color.fromRGBO(14, 161, 125, 1),
              size: 60,
            ),
            const SizedBox(height: 10),
            Text(
              "Order Placed Successfully!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        content: Text(
          "Your order has been placed successfully. Thank you for shopping with us!",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          GestureDetector(
            onTap: () {
              checkoutBloc.add(CheckoutNavigateToNavbarDoneButtonEvent());
            },
            child: const ButtonContainer(title: "Done"),
          )
        ],
      ),
    );
  }
}
