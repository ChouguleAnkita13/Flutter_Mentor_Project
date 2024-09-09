import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///CUSTOM DETAIL ROW WIDGET TO DISPLAY DETAILS PROVIDED TO WIDGET
class CustomDetailsRow extends StatelessWidget {
  const CustomDetailsRow(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.subtitle});
  final String title;
  final String subtitle;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(deviceWidth * 0.02), //8
          ///IMAGE
          child: Image.asset(
            imgUrl,
            height: deviceWidth < 500
                ? deviceWidth * 0.14 //56
                : deviceWidth * 0.1,
            width: deviceWidth < 500 ? deviceWidth * 0.14 : deviceWidth * 0.1,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: deviceWidth * 0.02),

        ///
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TITLE
            Text(
              title,
              style: GoogleFonts.sora(
                fontSize: deviceWidth * 0.05, //16
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),

            ///SUBTITLE
            Text(
              subtitle,
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.037
                    : deviceWidth * 0.03, //14,12
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(120, 131, 141, 1),
              ),
            ),
          ],
        ),

        const Spacer(),

        ///DONE BUTTON
        GestureDetector(
          onTap: () => Get.back(),
          child: Text(
            "Done",
            style: GoogleFonts.sora(
              fontSize: deviceWidth * 0.035, //14
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(29, 98, 202, 1),
            ),
          ),
        )
      ],
    );
  }
}
