import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY GREETINGS AND MENU BUTTON
class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    final double deviceWidth = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: deviceHeight / 8,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///MENU BUTTON
            GestureDetector(
              child: Icon(
                Icons.notes,
                size: deviceWidth * 0.06,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),

            ///GRERTINGS
            Text(
              "Hi Ankita",
              style: GoogleFonts.inter(

                  ///CONDITION CHECKED I.E DEVICE WIDTH GREATER THAN 500
                  /// TO DISPLAY TEXT WITHOUT OVERFLOW
                  fontSize: deviceWidth > 500
                      ? deviceWidth * 0.04
                      : deviceWidth * 0.06, //14,24
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
            ),

            Text(
              "Welcome to your smart home",
              style: GoogleFonts.inter(
                  fontSize: deviceWidth > 500
                      ? deviceWidth * 0.03
                      : deviceWidth * 0.045, //12, 18,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
            ),
          ]),
    );
  }
}
