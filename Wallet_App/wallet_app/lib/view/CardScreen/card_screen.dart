import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/CardScreen/Widgets/add_card_row.dart';
import 'package:wallet_app/view/CardScreen/Widgets/cards.dart';

///WIDGET TO DISPLAY ALL PAYMENT CARDS
class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

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
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///ADD CARD
            const AddCardRow(),

            ///
            SizedBox(height: deviceHeight * 0.04), //36

            ///DISPLAY ALL CARDS
            const Cards()
          ])),
    );
  }
}
