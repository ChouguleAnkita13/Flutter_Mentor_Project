import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(14, 161, 125, 1),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
