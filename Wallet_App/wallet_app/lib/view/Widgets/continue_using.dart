import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET IS USED TO LOGIN OR CREATE ACCOUNT USING FACEBOOK,GOOGLE OR IOS
class ContinueUsing extends StatelessWidget {
  const ContinueUsing({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Column(
      children: [
        ///TEXT: OR CONTINUE USING
        Text(
          "or continue using",
          style: GoogleFonts.sora(
            fontSize: deviceWidth * 0.03, //12
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(120, 131, 141, 1),
          ),
        ),

        ///SPACE BETWEEN TEXT AND ROW
        SizedBox(
          height: deviceHeight * 0.035,
        ),

        ///CONTINUE USING FACEBOOK,GOOGLE OR IOS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///CONTINUE USING FACEBOOK
            GestureDetector(
              child: Image.asset(
                "assets/images/login/facebook.png",
                height: deviceHeight * 0.05,
                width: deviceWidth * 0.25,
                fit: BoxFit.cover,
              ),
            ),

            ///CONTINUE USING GOOGLE
            GestureDetector(
              child: Image.asset(
                "assets/images/login/google.png",
                height: deviceHeight * 0.05,
                width: deviceWidth * 0.25,
                fit: BoxFit.cover,
              ),
            ),

            ///CONTINUE USING IOS
            GestureDetector(
              child: Image.asset(
                "assets/images/login/apple.png",
                height: deviceHeight * 0.05,
                width: deviceWidth * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
