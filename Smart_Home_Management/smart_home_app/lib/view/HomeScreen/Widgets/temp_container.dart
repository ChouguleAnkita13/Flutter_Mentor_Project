import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY TEMPRATURE
class TempContainer extends StatelessWidget {
  const TempContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    final double deviceWidth = MediaQuery.sizeOf(context).width;

    return Container(
      height: deviceHeight * 0.092, //84
      width: MediaQuery.sizeOf(context).width / 1.2,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.15),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80), bottomLeft: Radius.circular(80)),
      ),

      ///ROW TO DISPLAY TEMPRATURE IMAGE,°F,HUMIDITY
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/temp.png"),
          Text(
            "68°F",
            style: GoogleFonts.inter(
                fontSize: deviceWidth * 0.06, //24
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(255, 255, 255, 1)),
          ),
          Container(
              width: 2,
              height: deviceHeight * 0.044, //40
              color: const Color.fromRGBO(255, 255, 255, 1)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "69%",
                style: GoogleFonts.inter(
                    fontSize: deviceWidth * 0.05,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
              Text(
                "Humidity",
                style: GoogleFonts.inter(
                    fontSize: deviceWidth * 0.036, //16
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
