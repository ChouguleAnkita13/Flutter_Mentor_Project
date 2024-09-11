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
      child: GetBuilder<CardController>(
        ///CARD CONTROLLER
        init: CardController(),
        builder: (card) {
          return Stack(
            children: List.generate(card.cardsList.length, (index) {
              return Positioned(
                /// POSITION EACH CARD
                top: deviceHeight * 0.07 * index.toDouble(),  
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    ///SET SELECTED CARD
                    card.selectCard(card.cardsList[index]);

                    ///NAVIGATE TO CARDPAY SCREEN
                    Get.toNamed("/cardPayScreen");
                  },
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
              );
            }),
          );
        },
      ),
    );
  }
}
