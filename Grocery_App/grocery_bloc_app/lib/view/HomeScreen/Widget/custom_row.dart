import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w700),
          ),
          GestureDetector(
            child: Text("See all",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(14, 161, 125, 1),
                )),
          ),
        ],
      ),
    );
  }
}
