import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/mobile_number.dart';

///WIDGET TO DISPLAY LOGINSCREEN
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    log("${deviceWidth*0.9}");
    log("${deviceHeight*0.9}");

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
              ///TAP'NPAY IMAGE
              Image.asset(
                "assets/images/login/tapnpay.png",
              ),

              ///MOBILE IMAGE
              Image.asset(
                "assets/images/login/mobile.png",
                height: deviceHeight < 750 && deviceWidth > 600
                    ? deviceHeight * 0.25
                    : deviceHeight * 0.3,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),

        ///TO DISPLAY MOBILE NUMBER CONTAINER,MOBILENUMBER() WIDGET CALLED
        const Expanded(child: MobileNumber())
      ],
    ));
  }
}
