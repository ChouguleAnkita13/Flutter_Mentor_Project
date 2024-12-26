import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar {
  static customAppbar(String title) {
    return AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(title,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            )),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey[300]!)));
  }
}
