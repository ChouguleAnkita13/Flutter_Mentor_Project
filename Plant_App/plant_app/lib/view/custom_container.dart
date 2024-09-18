import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY COMMON CONTAINER FOR BUTTONS DECORATION
class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      width: deviceWidth,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                offset: Offset(0, 20),
                blurRadius: 40)
          ],
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(62, 102, 24, 1),
            Color.fromRGBO(124, 180, 70, 1)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          borderRadius: BorderRadius.circular(10)),
      child: title != "Get Started"
          ? Text(
              title,
              style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get Started",
                  style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 18,
                  color: Color.fromRGBO(255, 255, 255, 1),
                )
              ],
            ),
    );
  }
}
