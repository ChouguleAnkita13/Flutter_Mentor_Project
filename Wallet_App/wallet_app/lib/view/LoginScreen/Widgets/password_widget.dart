import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/CommonWidgets/common_container.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/password_textfield.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/reset_password.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    return Padding(
      padding: EdgeInsets.only(
          left: deviceWidth * 0.044,
          right: deviceWidth * 0.044,
          top: deviceWidth * 0.044,
          bottom: deviceWidth * 0.09), //15,37
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter your password",
            style: GoogleFonts.sora(
              fontSize: deviceWidth * 0.06, //21
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(25, 25, 25, 1),
            ),
          ),

          ///TEXTFIELD FOR PASSWORD
          const PasswordTextfield(),

          ///FORGET PASSWORD BUTTON
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: (){
                ///BOTTOMSHEET TO RESET PASSWORD 
                 showModalBottomSheet(context: context,
                barrierColor: const Color.fromRGBO(25, 25, 25, 0.7),
                 builder: (ctx)=>const ResetPassword());
              },
              child: Text(
                "Forgot password?",
                style: GoogleFonts.sora(
                  fontSize: deviceWidth * 0.035, //14
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(29, 98, 202, 1),
                ),
              ),
            ),
          ),

          ///LOGIN BUTTON
          GestureDetector(
            onTap: () => Get.offAll("/home"),
            child: const CommonContainer(title: "Login"),
          ),
        ],
      ),
    );
  }
}
