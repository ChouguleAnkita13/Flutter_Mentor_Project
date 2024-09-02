import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/password_widget.dart';

///WIDGET TO PASSWORDSCREEN AFTER CONTINUING FROM LOGINSCREEN
class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: deviceHeight < 750 && deviceWidth > 600
              ? deviceHeight * 0.5
              : deviceHeight * 0.58,
          width: double.infinity,
          color: const Color.fromRGBO(247, 244, 255, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: deviceWidth * 0.044),
                child: Row(
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
              ),

              ///PASSWORD IMAGE
              Image.asset(
                "assets/images/login/password.png",
                height: deviceHeight < 750 && deviceWidth > 600
                    ? deviceHeight * 0.25
                    : deviceHeight * 0.3,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),

        ///TO DISPLAY PASSWORD CONTAINER,PASSWORDWIDGET() CALLED
        const Expanded(child: PasswordWidget())
      ],
    ));
  }
}
