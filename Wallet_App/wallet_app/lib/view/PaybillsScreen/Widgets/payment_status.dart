import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY PAYMENT STATUS
class PaymentStatus extends StatelessWidget {
  const PaymentStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return SizedBox(
      height: deviceHeight>1000?deviceHeight / 4.7:deviceHeight / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///SUCCESS IMAGE
          Image.asset(
            "assets/images/more/success.png",
            height:deviceHeight * 0.14 ,//164
            width: deviceWidth * 0.4, //128
            fit: BoxFit.cover,
          ),

          /// STATUS
          Text(
            "Payment done!",
            style: GoogleFonts.sora(
              fontSize: deviceWidth * 0.04, //16
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(25, 25, 25, 1),
            ),
          ),

          ///
          SizedBox(
            width: deviceWidth * 0.5,
            child: Text(
              "Bill payment has been done successfully",
              textAlign: TextAlign.center,
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.03
                    : deviceWidth * 0.025, //12,10
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(83, 93, 102, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
