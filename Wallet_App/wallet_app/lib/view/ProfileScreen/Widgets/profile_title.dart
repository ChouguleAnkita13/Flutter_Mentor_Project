import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/Widgets/custom_back_button.dart';

class ProfileTitle extends StatelessWidget {
  const ProfileTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    return SizedBox(
      width: Get.width / 1.5,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///CUSTOM BACK BUTTON
          const  CustomBackButton(),
          ///TITLE
            Text(
              "Profile Settings",
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.042
                    : deviceWidth * 0.035, //16,14
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
        ],
      ),
    );
  }
}
