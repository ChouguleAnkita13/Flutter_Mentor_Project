import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO SHOW AMOUNT TEXTFIELD TO ENTER AMOUNT TO TRANSFER
class AmountTextfield extends StatelessWidget {
  const AmountTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Column(
      children: [
        ///TEXT
        Text(
          "Enter Amount",
          style: GoogleFonts.sora(
            fontSize: deviceWidth * 0.032, //13
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(120, 131, 141, 1),
          ),
        ),
        SizedBox(height: deviceHeight * 0.004),

        ///TEXTFIELD
        SizedBox(
          width: deviceWidth / 2.1,
          child: TextFormField(
            cursorColor: const Color.fromRGBO(25, 25, 25, 1),
            keyboardType: TextInputType.number,
            style: GoogleFonts.sora(
              fontSize: deviceWidth < 500
                  ? deviceWidth * 0.09
                  : deviceWidth * 0.07, //37
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(25, 25, 25, 1),
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              ///HINTTEXT
              hintText: "\$00.00",
              hintStyle: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.09
                    : deviceWidth * 0.07, //37
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(186, 194, 199, 1),
              ),
            ),
          ),
        )
      ],
    );
  }
}
