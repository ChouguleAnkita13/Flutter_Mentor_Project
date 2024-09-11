import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controller/card_controller.dart';

///WIDGET TO DISPLAY ALL CARDS
class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Expanded(
      child: GetBuilder(

          ///CARD CONTROLLER
          init: CardController(),
          builder: (card) {
            return ListView.builder(
              itemCount: card.cardsList.reversed.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  ///SET SELECTED CARD
                  card.selectCard(card.cardsList[index]);

                  ///NAVIGATE TO CARDPAYMENT SCREEN
                  Get.toNamed("/cardPayScreen");
                },
                child: Transform.translate(
                  offset: Offset(0, -deviceHeight * 0.15 * index.toDouble()),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                    child: Image.asset(
                      card.cardsList[index],
                      width: deviceWidth,
                      height: deviceHeight * 0.22, //201
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
