import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileTextfield extends StatelessWidget {
  const MobileTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      /// CONTAINER FOR BOX SHADOW
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              blurRadius: 20)
        ],
      ),
      child:TextFormField(
        keyboardType: TextInputType.phone,
        cursorColor: const Color.fromRGBO(164, 164, 164, 1),
        decoration: InputDecoration(
          prefixIcon: Image.asset("assets/images/phone.png"),
          hintText: "Mobile Number",
          hintStyle: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(164, 164, 164, 1),
            ),
          ),
          /// ROUNDED CORNERS AND BORDER CUSTOMIZATION
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(204, 211, 196, 1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(204, 211, 196, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(204, 211, 196, 1)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        ///VALIDATION
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your mobile number';
          } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
            return 'Please enter a valid 10-digit mobile number';
          }
          return null;
        },
      ),
    );
  }
}
