import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/card_controller.dart';
import 'package:wallet_app/view/CardScreen/Widgets/qr_pay.dart';
import 'package:wallet_app/view/Widgets/custom_back_button.dart';

///WIDGET TO DISPLAY CARD PAYMENT SCREEN
class CardPayScreen extends StatelessWidget {
  const CardPayScreen({super.key});

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
          bottom: deviceHeight * 0.04, //16
        ),
        child: Column(
          children: [
            ///CUSTOM BACK BUTTON
            const CustomBackButton(),

            ///
            SizedBox(height: deviceHeight * 0.04), //36

            SizedBox(
              height: deviceHeight/1.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///TO DISPLAY CARD
                  ///CARD CONTROLLER
                  GetBuilder<CardController>(builder: (card) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                      child: Image.asset(
                        card.selectedCard!,
                        width: deviceWidth,
                        height: deviceHeight * 0.23, //210
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
              
                  ///MIDDLE WIFI ICON AND TEXT
                  Column(
                    children: [
                      ///WIFI ICON
                      Transform.rotate(
                        angle: 0.785398,
                        child: Icon(
                          Icons.wifi,
                          color: const Color.fromRGBO(120, 131, 141, 1),
                          size: deviceWidth * 0.06,
                        ),
                      ),
                      Text(
                        "Move near a device to pay",
                        style: GoogleFonts.sora(
                          fontSize: deviceWidth < 500
                              ? deviceWidth * 0.04
                              : deviceWidth * 0.035, //14,12
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(120, 131, 141, 1),
                        ),
                      ),
                    ],
                  ),
              
                  ///QR PAY BUTTON
                  GestureDetector(
                    child: const QRPay(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
