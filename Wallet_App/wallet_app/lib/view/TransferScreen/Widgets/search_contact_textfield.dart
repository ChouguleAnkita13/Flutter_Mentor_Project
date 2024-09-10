import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY SEARCH  CONTACT TEXTFIELD
class SearchContactTextfield extends StatelessWidget {
  const SearchContactTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return SizedBox(
      height: deviceHeight * 0.04, //36

      ///TEXTFIELD
      child: TextFormField(
        cursorColor: const Color.fromRGBO(83, 93, 102, 1),
        decoration: InputDecoration(

            ///SEARCH ICON
            prefixIcon: Image.asset("assets/icons/search.png"),

            ///HINTTEXT
            hintText: "Search contact",
            hintStyle: GoogleFonts.sora(
              fontSize: deviceWidth<500? deviceWidth * 0.035:deviceWidth * 0.03, //14,12
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(186, 194, 199, 1),
            ),

            ///ALL BORDER DECORATION FOR TEXTFIELD
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(225, 227, 237, 1),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(225, 227, 237, 1),
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(225, 227, 237, 1),
                ))),
      ),
    );
  }
}
