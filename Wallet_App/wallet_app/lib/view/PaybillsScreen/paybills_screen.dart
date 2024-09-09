import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/PaybillsScreen/Widgets/payto.dart';
import 'package:wallet_app/view/PaybillsScreen/Widgets/saved_billers.dart';
import 'package:wallet_app/view/PaybillsScreen/Widgets/search_textfield.dart';
import 'package:wallet_app/view/Widgets/custom_back_button.dart';

///WIDGET TO DISPLAY BILLS TO PAY
class PaybillsScreen extends StatelessWidget {
  const PaybillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    log("${deviceWidth * 0.04}");
    log("${deviceHeight * 0.14}");
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
            ///CUSTOM BACK BUTTON

            const CustomBackButton(),

            ///
            SizedBox(height: deviceHeight * 0.04), //36
            ///
            const PayTo(),
            SizedBox(height: deviceHeight * 0.02), //18

            ///SEARCH TEXTFIELD
            const SearchTextfield(),
            ///
            SizedBox(height: deviceHeight * 0.025),//22
            ///SHOW SAVED BILLERS
            const Expanded(child: SavedBillers())

            
          ])),
    );
  }
}
