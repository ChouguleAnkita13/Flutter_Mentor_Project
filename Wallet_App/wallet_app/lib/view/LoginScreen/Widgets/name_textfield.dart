import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NameTextfield extends StatelessWidget {
  const NameTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///TEXT
        Text(
          "Name",
          style: GoogleFonts.sora(
            fontSize: deviceWidth * 0.03, //12
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        SizedBox(height: deviceHeight * 0.004),

        ///TEXTFIELD
        SizedBox(
          height: deviceHeight * 0.05,
          child: TextFormField(
            cursorColor: const Color.fromRGBO(83, 93, 102, 1),
            decoration: InputDecoration(

                ///HINTTEXT
                hintText: "e.g. John Doe",
                hintStyle: GoogleFonts.sora(
                  fontSize: deviceWidth * 0.03, //12
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
        )
      ],
    );
  }
}
