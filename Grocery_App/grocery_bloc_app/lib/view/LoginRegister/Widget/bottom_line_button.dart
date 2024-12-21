import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomLineButton extends StatelessWidget {
  const BottomLineButton(
      {super.key, required this.content, required this.title});
  final String content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 18,
      child: Row(
        children: [
          Text(
            content,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.6),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color.fromRGBO(14, 161, 125, 1),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
