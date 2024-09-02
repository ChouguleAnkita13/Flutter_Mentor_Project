import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/CommonWidgets/common_container.dart';

///WIDGET TO RESET PASSWORD
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Container(
      ///DECORATION
      width: deviceWidth,
      height: deviceHeight/2.5,
      padding: EdgeInsets.only(
          left: deviceWidth * 0.044,
          right: deviceWidth * 0.044,
          top: deviceWidth * 0.044,
          bottom: deviceWidth * 0.08),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(deviceWidth * 0.05),
              topRight: Radius.circular(deviceWidth * 0.05))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///TEXT
              Text(
                "Forgot your password?",
                style: GoogleFonts.sora(
                  fontSize: deviceWidth * 0.055, //21
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
              ///DONE BUTTON
              GestureDetector(
                onTap: ()=>Get.back(),
                child: Text(
                  "Done",
                  style: GoogleFonts.sora(
                    fontSize: deviceWidth * 0.035, //14
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(29, 98, 202, 1),
                  ),
                ),
              )
            ],
          ),

           ///SEND RESET LINK
          GestureDetector(
            onTap: () => Get.toNamed("/login"),
            child: const CommonContainer(title: "Send reset link"),
          ),
        ],
      ),
    );
  }
}
