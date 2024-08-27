import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY GREETINGS AND MENU BUTTON
class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height/8,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        ///MENU BUTTON
        GestureDetector(
          child: Icon(
            Icons.notes,
            size: width * 0.06,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
       
        ///GRERTINGS
        Text(
          "Hi Ankita",
          style: GoogleFonts.inter(
              fontSize: width*0.06,//24
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
       
        Text(
          "Welcome to your smart home",
          style: GoogleFonts.inter(
              fontSize:width * 0.045,// 18,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
      ]),
    );
  }
}
