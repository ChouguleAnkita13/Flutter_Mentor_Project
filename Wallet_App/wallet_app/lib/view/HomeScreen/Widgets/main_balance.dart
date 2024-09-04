import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO SHOW MAIN BALANCE
class MainBalance extends StatelessWidget {
  const MainBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.08, vertical: deviceWidth * 0.06), //32,24
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(deviceWidth * 0.04), //16,
        color: const Color.fromRGBO(80, 51, 164, 0.7),
      ),
      child: Column(
        children: [
          Text(
            "Main Balance",
            style: GoogleFonts.sora(
              fontSize:
                  deviceWidth < 500 ? deviceWidth * 0.03 : deviceWidth * 0.02,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(178, 161, 228, 1),
            ),
          ),

          ///TEXTSPAN
          Text.rich(TextSpan(children: [
            TextSpan(
              text: "\$14,235",
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.085
                    : deviceWidth * 0.05, //14
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            TextSpan(
              text: ".34",
              style: GoogleFonts.sora(
                fontSize:
                    deviceWidth < 500 ? deviceWidth * 0.04 : deviceWidth * 0.03,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ])),

          SizedBox(height: deviceHeight * 0.03),

          ///TOPUP,WITHDRAW,TRANSFER
          SizedBox(
            height: deviceHeight * 0.055,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///TOPUP
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/icons/topup.png",
                        height: deviceWidth * 0.04,
                        width: deviceWidth * 0.04,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "Topup",
                        style: GoogleFonts.sora(
                          fontSize: deviceWidth < 500
                              ? deviceWidth * 0.03
                              : deviceWidth * 0.02,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  ),
                ),

                ///LINE
                Container(
                  width: deviceWidth * 0.006,
                  height: deviceHeight * 0.027,
                  color: const Color.fromRGBO(111, 69, 233, 1),
                ),

                ///WITHDRAW
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/icons/withdraw.png",
                        height: deviceWidth * 0.04,
                        width: deviceWidth * 0.04,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "Withdraw",
                        style: GoogleFonts.sora(
                          fontSize: deviceWidth < 500
                              ? deviceWidth * 0.03
                              : deviceWidth * 0.02,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  ),
                ),

                ///LINE
                Container(
                  width: deviceWidth * 0.006,
                  height: deviceHeight * 0.027,
                  color: const Color.fromRGBO(111, 69, 233, 1),
                ),

                ///TRANSFER
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/icons/transfer.png",
                        height: deviceWidth * 0.04,
                        width: deviceWidth * 0.04,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "Transfer",
                        style: GoogleFonts.sora(
                          fontSize: deviceWidth < 500
                              ? deviceWidth * 0.03
                              : deviceWidth * 0.02,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
