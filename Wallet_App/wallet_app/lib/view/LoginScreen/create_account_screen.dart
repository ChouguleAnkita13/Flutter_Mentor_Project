import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/create_account.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.044, vertical: deviceHeight * 0.06),

        ///BACK BUTTON AND TAP'NPAY IMAGE
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///BACK BUTTON
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,
                          size: deviceWidth * 0.04,
                          color: const Color.fromRGBO(29, 98, 202, 1)),
                      Text(
                        " Back",
                        style: GoogleFonts.sora(
                          fontSize: deviceWidth * 0.035, //14
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(29, 98, 202, 1),
                        ),
                      ),
                    ],
                  ),
                ),

                ///TAP'NPAY IMAGE

                Image.asset(
                  "assets/images/login/tapnpay.png",
                ),
                const SizedBox()
              ],
            ),

            const Spacer(),
            ///CREATEACCOUNT() WIDGET,TO DISPLAY CHECKBOX,CREATEACCOUNT BUTTON AND TEXTFIELDS FOR NAME,EMAIL,PASSWORD
            const CreateAccount()
          ],
        ),
      ),
    );
  }
}
