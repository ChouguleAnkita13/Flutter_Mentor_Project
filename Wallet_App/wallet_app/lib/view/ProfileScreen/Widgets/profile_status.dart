import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///PROFILE IMAGE ,USER NAME,STATUS
class ProfileStatus extends StatelessWidget {
  const ProfileStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Center(
      child: Column(
        children: [
          ///PROFILE IMAGE
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: const Color.fromRGBO(79, 188, 168, 1),
                        width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/home/profile.png",
                    height: deviceWidth * 0.24,
                    width: deviceWidth * 0.24, //98
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: deviceHeight*0.085,
                bottom: 0,
                right: 0,
                  child: Icon(
                Icons.safety_check,
                color: const Color.fromRGBO(79, 188, 168, 1),
                size: deviceWidth * 0.07,
              ))
            ],
          ),
          SizedBox(height: deviceHeight * 0.011), //10

          ///USER NAME
          Text(
            "Ankita Chougule",
            style: GoogleFonts.sora(
              fontSize: deviceWidth < 500
                  ? deviceWidth * 0.035
                  : deviceWidth * 0.03, //14,12
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(25, 25, 25, 1),
            ),
          ),

          ///STATUS
          Text(
            "Joined 2 years ago",
            style: GoogleFonts.sora(
              fontSize: deviceWidth < 500
                  ? deviceWidth * 0.03
                  : deviceWidth * 0.025, //14,12
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(120, 131, 141, 1),
            ),
          )
        ],
      ),
    );
  }
}
