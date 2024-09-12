import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/reset_password.dart';
import 'package:wallet_app/view/Widgets/common_container.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/password_textfield.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///GLOBAL KEY FOR FORM VALIDATION
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.only(
          left: deviceWidth * 0.044,
          right: deviceWidth * 0.044,
          top: deviceWidth * 0.044,
          bottom: deviceWidth * 0.09), //15,37
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

          ///
          SizedBox(
            height: deviceHeight * 0.03,
          ),

          ///TEXTFIELD FOR PASSWORD
          Form(key: formKey, child: const PasswordTextfield()),

          SizedBox(
            height: deviceHeight * 0.01,
          ),

          ///FORGET PASSWORD BUTTON
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                ///BOTTOMSHEET TO RESET PASSWORD
                Get.bottomSheet(
                  const ResetPassword(),
                  barrierColor: const Color.fromRGBO(25, 25, 25, 0.7),
                );
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

          ///
          const Spacer(),

          ///LOGIN BUTTON
          GestureDetector(
            onTap: () {
              ///VALIDATE THE FORM WHEN THE BUTTON IS PRESSED
              if (formKey.currentState!.validate()) {
                Get.offAllNamed("/bNavigation");
              }
            },
            child: const CommonContainer(title: "Login"),
          ),
        ],
      ),
    );
  }
}
