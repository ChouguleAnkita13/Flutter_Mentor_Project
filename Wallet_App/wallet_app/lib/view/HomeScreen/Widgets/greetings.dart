import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return SizedBox(
       height: deviceHeight * 0.06,//54
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///PROFILE IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              "assets/images/home/profile.png",
              height: deviceWidth * 0.12,
              width: deviceWidth * 0.12,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: deviceHeight * 0.008),
          ///GREETINGS AND NAME
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///GREETING
              Text(
                "Hello,",
                style: GoogleFonts.sora(
                  fontSize: deviceWidth<500 ?deviceWidth * 0.035:deviceWidth*0.025, //14,10
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              ///NAME
              Text(
                "Ankita!",
                style: GoogleFonts.sora(
                  fontSize:  deviceWidth<500 ?deviceWidth * 0.035:deviceWidth*0.025, //14
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
         const Spacer(),
         ///PROFILE SETTINGS ICON
          GestureDetector(
            onTap: ()=>Get.toNamed("/profile"),
            child: Image.asset(
              "assets/icons/settings.png",
              height: deviceWidth * 0.07,
              width: deviceWidth * 0.07,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
