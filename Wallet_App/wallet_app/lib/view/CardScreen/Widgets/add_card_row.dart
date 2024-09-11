import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY MYCARD TEXT AND ADD CARD BUTTON
class AddCardRow extends StatelessWidget {
  const AddCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///
        Text(
          "My Cards",
          style: GoogleFonts.sora(
            fontSize: deviceWidth * 0.06, //24
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(25, 25, 25, 1),
          ),
        ),

        ///ADD CARD BUTTON
        GestureDetector(
          onTap: () => {},
          child: Row(
            children: [
              Text(
                "Add card ",
                style: GoogleFonts.sora(
                  fontSize: deviceWidth * 0.04, //16
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(29, 98, 202, 1),
                ),
              ),
              Icon(Icons.add,
                  size: deviceWidth * 0.042,
                  color: const Color.fromRGBO(29, 98, 202, 1)),
            ],
          ),
        )
      ],
    );
  }
}
