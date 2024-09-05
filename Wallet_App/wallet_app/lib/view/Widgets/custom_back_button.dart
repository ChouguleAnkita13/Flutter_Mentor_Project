import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY BACK BUTTON
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    return GestureDetector(
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
    );
  }
}
