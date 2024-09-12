import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/login_controller.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/email_textfield.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/name_textfield.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/password_textfield.dart';
import 'package:wallet_app/view/Widgets/common_container.dart';
import 'package:wallet_app/view/Widgets/continue_using.dart';

/// WIDGET TO DISPLAY CHECKBOX,CREATEACCOUNT BUTTON AND TEXTFIELDS FOR NAME,EMAIL,PASSWORD
class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///GLOBAL KEY FOR FORM VALIDATION
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SizedBox(
      height: deviceHeight / 1.6,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///TEXT
            Text(
              "Create Account",
              style: GoogleFonts.sora(
                fontSize: deviceWidth * 0.06, //21
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),

            ///TEXTFIELD WITH VALIDATION

            SizedBox(
              height: deviceHeight / 3.5,
              child: Form(
                key: formKey,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///NAME TEXTFIELD
                    NameTextfield(),

                    ///EMAIL TEXTFIELD
                    EmailTextfield(),

                    ///PASSWORD TEXTFIELD
                    PasswordTextfield(),
                  ],
                ),
              ),
            ),

            ///ROW FOR CHECKBOX AND CONDITION TEXTSPAN
            Row(
              children: [
                ///CHECKBOX
                GetBuilder<LoginController>(
                  builder: (loginController) => Checkbox(
                      value: loginController.isChecked,
                      side: const BorderSide(
                          color: Color.fromRGBO(83, 93, 102, 1)),
                      activeColor: const Color.fromRGBO(29, 98, 202, 1),
                      onChanged: (val) => {loginController.selectCheckBox()}),
                ),

                ///TEXTSPAN
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

            ///CREATE AN ACCOUNT BUTTON
            GestureDetector(
              onTap: () {
                ///VALIDATE THE FORM WHEN THE BUTTON IS PRESSED
                if (formKey.currentState!.validate()) {
                  Get.toNamed("/otpScreen");
                }
              },
              child: const CommonContainer(title: "Create a new account"),
            ),

            ///CONTINUEUSING() WIDGET TO LOGIN CONTINUE WITH FACEBOOK,GOOGLE OR IOS
            const ContinueUsing(),
          ]),
    );
  }
}
