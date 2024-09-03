import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO BACK BUTTON AND TAP'NPAY IMAGE
class CommonBackrow extends StatelessWidget {
  const CommonBackrow({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    return SizedBox(
      width: deviceWidth / 1.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///BACK BUTTON
          GestureDetector(
            onTap: () => Get.back(),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios,
                    size: deviceWidth * 0.04,
                    color: const Color.fromRGBO(29, 98, 202, 1)),
                Text(
                  " Back",
                  style: GoogleFonts.sora(
                    fontSize: deviceWidth * 0.035, //14
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(29, 98, 202, 1),
                  ),
                ),
              ],
            ),
          ),

          ///TAP'NPAY IMAGE

          Image.asset(
            "assets/images/login/tapnpay.png",
          ),
        ],
      ),
    );
  }
}
