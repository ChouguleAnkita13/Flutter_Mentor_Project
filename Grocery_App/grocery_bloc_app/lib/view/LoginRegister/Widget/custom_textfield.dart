import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.title,
    required this.textcontroller,
  });
  final String title;
  final TextEditingController textcontroller;

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
        controller: textcontroller,
        obscureText: title != "Password" ? false : true,
        cursorColor: Colors.black,
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
            suffixIcon: title != "Password"
                ? const SizedBox()
                : GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.visibility_off,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      size: 18,
                    ),
                  ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
