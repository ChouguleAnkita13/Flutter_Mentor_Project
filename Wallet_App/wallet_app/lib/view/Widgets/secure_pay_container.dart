import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
///WIDGET TO DISPLAY SECURE PAYMENT CONTANER
class SecurePayContainer extends StatelessWidget {
  const SecurePayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.03, //12
        vertical: deviceWidth * 0.041, //16
      ),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(253, 194, 40, 1),
          borderRadius: BorderRadius.circular(deviceWidth * 0.02)),
      child: SizedBox(
        width: deviceWidth / 2.5,
        child: Row(
          children: [
            /// IMAGE
            Image.asset("assets/images/more/secure.png"),

            ///TEXT
            Text(
              "  Secure payment",
              style: GoogleFonts.sora(
                fontSize: deviceWidth * 0.035, //14
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(39, 6, 133, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
