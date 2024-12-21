import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 3),
              blurRadius: 10)
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
