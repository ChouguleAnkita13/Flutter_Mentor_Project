import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET CONTAIN TRANSFERTO TEXT AND NEW CONTACT
class TransferTo extends StatelessWidget {
  const TransferTo({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///TITLE
        Text(
          "Transfer To",
          style: GoogleFonts.sora(
            fontSize: deviceWidth < 500
                ? deviceWidth * 0.06
                : deviceWidth * 0.05, //24,20
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(25, 25, 25, 1),
          ),
        ),

        ///NEW CONTACT
        Padding(
          padding: EdgeInsets.only(
              bottom: deviceHeight * 0.02, top: deviceHeight * 0.04), //18,36
          child: Row(
            children: [
              ///CONTAINER TO ADD NEW CONTACT
              GestureDetector(
                child: Container(
                  height: deviceWidth * 0.12, //49
                  width: deviceWidth * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromRGBO(230, 221, 255, 1),
                  ),
                  child: Icon(Icons.add,
                      size: deviceWidth * 0.06,
                      color: const Color.fromRGBO(87, 50, 191, 1)),
                ),
              ),
              SizedBox(width: deviceWidth * 0.025), //10
              ///TEXT
              Text(
                "New contact",
                style: GoogleFonts.sora(
                  fontSize: deviceWidth < 500
                      ? deviceWidth * 0.035
                      : deviceWidth * 0.03, //14,12
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
            ],
          ),
        ),

        ///DEVIDER
        Center(
          child: Text(
            "Or",
            style: GoogleFonts.sora(
              fontSize: deviceWidth < 500
                  ? deviceWidth * 0.03
                  : deviceWidth * 0.025, //14,12
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(120, 131, 141, 1),
            ),
          ),
        ),
      ],
    );
  }
}
