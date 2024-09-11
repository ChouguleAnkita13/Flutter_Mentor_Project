import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/view/Widgets/common_container.dart';

///WIDGET TO DISPLAY PAYMENT FAILED STATUS
class PayFailedScreen extends StatelessWidget {
  const PayFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 246, 246, 1),
        body: Padding(
            padding: EdgeInsets.only(
                left: deviceWidth * 0.044,
                right: deviceWidth * 0.044,
                bottom: deviceHeight * 0.06),

            ///PAYMENT STATUS
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: deviceHeight / 1.7,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: deviceHeight > 1000
                            ? deviceHeight / 4.7
                            : deviceHeight / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///STATUS IMAGE
                            Image.asset(
                              "assets/images/more/failed.png",
                              height: deviceHeight * 0.14, //164
                              width: deviceWidth * 0.4, //128
                              fit: BoxFit.cover,
                            ),

                            /// STATUS
                            Text(
                              "Transfer Failed :(",
                              style: GoogleFonts.sora(
                                fontSize: deviceWidth * 0.04, //16
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(25, 25, 25, 1),
                              ),
                            ),

                            ///
                            SizedBox(
                              width: deviceWidth * 0.5,
                              child: Text(
                                "Your transfer has been declined due to a technical issue",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.sora(
                                  fontSize: deviceWidth < 500
                                      ? deviceWidth * 0.03
                                      : deviceWidth * 0.025, //12,10
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(83, 93, 102, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///BACK TO WALLET
                      GestureDetector(
                          onTap: () => Get.toNamed("/bNavigation"),
                          child:
                              const CommonContainer(title: "Back to wallet")),
                    ]),
              ),
            )));
  }
}
