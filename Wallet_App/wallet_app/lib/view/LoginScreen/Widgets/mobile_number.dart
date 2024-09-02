import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/CommonWidgets/continue_using.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/mobile_textfield.dart';
import 'package:wallet_app/view/CommonWidgets/common_container.dart';

///WIDGET TO DISPLAY MOBILE NUMBER CONTAINER
class MobileNumber extends StatelessWidget {
  const MobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    return Padding(
      padding: EdgeInsets.only(left:deviceWidth * 0.044,right: deviceWidth * 0.044,top: deviceWidth * 0.044,bottom: deviceWidth * 0.09), //15,37
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: deviceWidth / 2,

            ///TEXT
            child: Text(
              "Enter your mobile number",
              style: GoogleFonts.sora(
                fontSize: deviceWidth * 0.06, //21
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
          ),

          ///TEXTFIELD FOR MOBILE NUMBER
          const MobileTextfield(),

          ///CONTINUE BUTTON
          GestureDetector(
            onTap: () =>Get.toNamed("/password"),
            child: const CommonContainer(title: "Continue"),
          ),

          ///CONTINUEUSING() WIDGET TO LOGIN CONTINUE WITH FACEBOOK,GOOGLE OR IOS

          const ContinueUsing(),
        ],
      ),
    );
  }
}
