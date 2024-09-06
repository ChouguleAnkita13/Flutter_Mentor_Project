import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/ProfileScreen/Widgets/profile_info.dart';
import 'package:wallet_app/view/ProfileScreen/Widgets/profile_status.dart';
import 'package:wallet_app/view/ProfileScreen/Widgets/profile_title.dart';

///WIDGET TO DISPLAY PROFILE SETTINGS
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    log("${deviceWidth * 0.24}");
    log("${deviceHeight * 0.011}");
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
          padding: EdgeInsets.only(
            left: deviceWidth * 0.044,
            right: deviceWidth * 0.044,
            top: deviceHeight * 0.06,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///PROFILE TITLE
            const ProfileTitle(),

            ///
            SizedBox(height: deviceHeight * 0.055),//50

            ///PROFILE STATUS
            const ProfileStatus(),
            ///
            SizedBox(height: deviceHeight * 0.053),

            ///PROFILE INFO
            const ProfileInfo()
          ])),
    );
  }
}
