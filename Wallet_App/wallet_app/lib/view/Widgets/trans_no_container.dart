import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///COMMON WIDGET FOR DISPLAYING DATA
class TransactionNoContainer extends StatelessWidget {
  const TransactionNoContainer(
      {super.key, required this.title, required this.transNo});
  final String title;
  final String transNo;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Container(
      ///DECORATION CONTAINER
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.03, //12
        vertical: deviceWidth * 0.041, //16
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(237, 239, 246, 1),
          ),
          borderRadius: BorderRadius.circular(deviceWidth * 0.02)),

      ///TEXT AND TRANSCATION NO
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///TEXT
            Text(
              title,
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.035
                    : deviceWidth * 0.025, //14,9
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(120, 131, 141, 1),
              ),
            ),

            ///TRANSACTION NO.
            Text(
              transNo,
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.035
                    : deviceWidth * 0.02, //14,9
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(83, 93, 102, 1),
              ),
            ),
          ]),
          const Spacer(),

          ///COPY ICON
          Icon(
            Icons.copy_rounded,
            color: const Color.fromRGBO(83, 93, 102, 1),
            size: deviceHeight * 0.03,
          ),
        ],
      ),
    );
  }
}
