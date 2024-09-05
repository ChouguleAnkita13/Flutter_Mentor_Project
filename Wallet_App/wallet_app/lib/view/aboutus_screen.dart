import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/Widgets/custom_back_button.dart';

///WIDGET TO SHOW ABOUT E WALLET APP
class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    log("${deviceWidth * 0.025}");
    log("${deviceHeight * 0.035}");
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: EdgeInsets.only(
          left: deviceWidth * 0.044,
          right: deviceWidth * 0.044,
          top: deviceHeight * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///BACK BUTTON
            const CustomBackButton(),

            ///
            SizedBox(height: deviceHeight * 0.035),

            ///TEXT
            Text(
              "About eWallet",
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.07
                    : deviceWidth * 0.05, //24,18
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),

            SizedBox(height: deviceHeight * 0.035),

            ///ABOUT E-WALLET
            Text(
              """Our app allows you to easily store, manage, and spend your money on the go. With our secure platform, you can make transactions, check your balance, and track your spending all in one place.

Whether you're paying bills, shopping online, or sending money to friends and family, our app makes it easy and convenient to do so. Plus, with our various promotions and discounts, you can save even more while using our app.

Thank you for choosing us as your preferred e-wallet solution. If you have any questions or feedback, please don't hesitate to contact us. We're always here to help.""",
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.035
                    : deviceWidth * 0.03, //14,12
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(83, 93, 102, 1),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
