import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO SHOW QR CODE CONTAINER
class QRPay extends StatelessWidget {
  const QRPay({super.key});
  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    return Container(
      height: deviceHeight * 0.05, //45
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(87, 50, 191, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///QR CODE ICON
          Icon(
            Icons.qr_code_2,
            color: const Color.fromRGBO(255, 255, 255, 1),
            size: deviceWidth * 0.04,
          ),
          ///TEXT
          Text(
            "  QR Pay",
            style: GoogleFonts.sora(
              fontSize: deviceWidth * 0.034,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ],
      ),
    );
  }
}
