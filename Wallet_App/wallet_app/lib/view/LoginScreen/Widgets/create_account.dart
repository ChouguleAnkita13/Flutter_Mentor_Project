import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/login_controller.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/email_textfield.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/name_textfield.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/password_textfield.dart';
import 'package:wallet_app/view/Widgets/common_container.dart';
import 'package:wallet_app/view/Widgets/continue_using.dart';

/// WIDGET TO DISPLAY CHECKBOX, CREATEACCOUNT BUTTON, AND TEXTFIELDS FOR NAME, EMAIL, PASSWORD
class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    /// GLOBAL KEY FOR FORM VALIDATION
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return SizedBox(
      height: deviceHeight / 1.6,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// HEADER TEXT: CREATE ACCOUNT
            Text(
              "Create Account",
              style: GoogleFonts.sora(
                fontSize: deviceWidth * 0.06, //21
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),

            /// FORM FIELDS: NAME, EMAIL, PASSWORD
            SizedBox(
              height: deviceHeight / 3.5,
              child: Form(
                key: formKey,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// NAME TEXTFIELD WITH VALIDATION
                    NameTextfield(),

                    /// EMAIL TEXTFIELD WITH VALIDATION
                    EmailTextfield(),

                    /// PASSWORD TEXTFIELD WITH VALIDATION
                    PasswordTextfield(),
                  ],
                ),
              ),
            ),

            /// CHECKBOX AND CONDITIONS TEXT
            Row(
              children: [
                /// CHECKBOX FOR ACCEPTING TERMS AND CONDITIONS
                GetBuilder<LoginController>(
                  builder: (loginController) => Checkbox(
                    value: loginController.isChecked,
                    side: const BorderSide(
                        color: Color.fromRGBO(83, 93, 102, 1)),
                    activeColor: const Color.fromRGBO(29, 98, 202, 1),
                    onChanged: (val) => {
                      loginController.selectCheckBox()
                    },
                  ),
                ),

                /// TEXT FOR TERMS AND CONDITIONS
                Expanded(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "I accept",
                      style: GoogleFonts.sora(
                        fontSize: deviceWidth * 0.03, //12
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(25, 25, 25, 1),
                      ),
                    ),
                    TextSpan(
                      text: " terms and conditions",
                      style: GoogleFonts.sora(
                        fontSize: deviceWidth * 0.03, //12
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(29, 98, 202, 1),
                      ),
                    ),
                    TextSpan(
                      text: " and",
                      style: GoogleFonts.sora(
                        fontSize: deviceWidth * 0.03, //12
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(25, 25, 25, 1),
                      ),
                    ),
                    TextSpan(
                      text: " privacy policy",
                      style: GoogleFonts.sora(
                        fontSize: deviceWidth * 0.03, //12
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(29, 98, 202, 1),
                      ),
                    )
                  ])),
                )
              ],
            ),

            /// CREATE ACCOUNT BUTTON WITH FORM VALIDATION AND CHECKBOX VALIDATION
            GestureDetector(
              onTap: () {
                /// CHECK IF FORM FIELDS ARE VALID AND IF CHECKBOX IS CHECKED
                if (formKey.currentState!.validate()) {
                  if (Get.find<LoginController>().isChecked) {
                    Get.toNamed("/otpScreen");
                  } else {
                    /// SHOW ERROR IF CHECKBOX IS NOT SELECTED
                    Get.snackbar(
                      "Terms and Conditions",
                      "Please accept the terms and conditions to proceed.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                }
              },
              child: const CommonContainer(title: "Create a new account"),
            ),

            /// CONTINUE USING WIDGET FOR OTHER LOGIN OPTIONS
            const ContinueUsing(),
          ]),
    );
  }
}
