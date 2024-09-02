import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///TEXT
        Text(
          "Password",
          style: GoogleFonts.sora(
            fontSize: deviceWidth * 0.03, //12
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(0, 0, 0, 1),
          ),
        ),

        ///TEXTFIELD
        SizedBox(
          height: deviceHeight * 0.05,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(

                ///HINTTEXT
                hintText: "Enter your password",
                hintStyle: GoogleFonts.sora(
                  fontSize: deviceWidth * 0.03, //12
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(83, 93, 102, 1),
                ),

                ///VISIBILITY ICON
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  size: deviceHeight * 0.025,
                  color: const Color.fromRGBO(83, 93, 102, 1),
                ),
                enabledBorder: OutlineInputBorder(
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
