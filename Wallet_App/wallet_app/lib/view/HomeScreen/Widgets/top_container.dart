import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/HomeScreen/Widgets/greetings.dart';
import 'package:wallet_app/view/HomeScreen/Widgets/main_balance.dart';

///WIDGET CONTAINES GREETINGS AND MAIN BALANCE
class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Container(
        color: const Color.fromRGBO(39, 6, 133, 1),
        padding: EdgeInsets.only(
            left: deviceWidth * 0.044,
            right: deviceWidth * 0.044,
            top: deviceHeight * 0.06,
            bottom: deviceHeight * 0.04),
        child: Column(
          children: [
            const Greetings(),
            SizedBox(height: deviceHeight * 0.03),
            const MainBalance()
          ],
        ));
  }
}
