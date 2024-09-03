import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, required this.title});
  final String title;
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
      child: Text(
        title,
        style: GoogleFonts.sora(
          fontSize: deviceWidth * 0.034,
          fontWeight: FontWeight.w600,
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
    );
  }
}
