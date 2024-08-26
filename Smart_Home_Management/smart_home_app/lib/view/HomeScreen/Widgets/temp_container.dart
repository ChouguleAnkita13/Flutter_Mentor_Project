import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Widget to display the temprature
///
class TempContainer extends StatelessWidget {
  const TempContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.sizeOf(context).width / 1.2,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.15),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80), bottomLeft: Radius.circular(80)),
      ),
      //Row to display tempreature image,°F,humidity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/temp.png"),
          Text(
            "68°F",
            style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(255, 255, 255, 1)),
          ),
          Container(
              width: 2,
              height: 40,
              color: const Color.fromRGBO(255, 255, 255, 1)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "69%",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
              Text(
                "Humidity",
                style: GoogleFonts.inter(
                    fontSize: 16,
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
