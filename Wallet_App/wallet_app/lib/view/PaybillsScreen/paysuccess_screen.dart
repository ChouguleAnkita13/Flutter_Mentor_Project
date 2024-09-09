import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/PaybillsScreen/Widgets/pay_details.dart';

///WIDGET TO DISPLAY PAYMENT STATUS AND PAYMENT DETAILS
class PaySuccessScreen extends StatelessWidget {
  const PaySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: Padding(
          padding: EdgeInsets.only(
              left: deviceWidth * 0.044,
              right: deviceWidth * 0.044,
              top: deviceHeight * 0.06,
              bottom: deviceHeight * 0.06),

          ///PAYMENT DETAILS
          child: const PayDetails(),
        ));
  }
}
