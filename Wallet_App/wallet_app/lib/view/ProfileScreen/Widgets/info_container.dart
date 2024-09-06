import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.subTitle});
  final String imgUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              top: deviceHeight * 0.015, bottom: deviceHeight * 0.015),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: const Color.fromRGBO(237, 239, 246, 1),
                      width: deviceHeight * 0.0015))),
          child: Row(
            ///IMAGE
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(deviceWidth * 0.02), //8
                child: Image.asset(
                  imgUrl,
                  height: deviceWidth < 500
                      ? deviceWidth * 0.09 //32
                      : deviceWidth * 0.06,
                  width: deviceWidth < 500
                      ? deviceWidth * 0.09
                      : deviceWidth * 0.06,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: deviceWidth * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///TEXT
                  Text(
                    title,
                    style: GoogleFonts.sora(
                      fontSize: deviceWidth < 500
                          ? deviceWidth * 0.03
                          : deviceWidth * 0.025, //14,12
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(120, 131, 141, 1),
                    ),
                  ),

                  ///USER NAME
                  Text(
                    subTitle,
                    style: GoogleFonts.sora(
                      fontSize: deviceWidth < 500
                          ? deviceWidth * 0.035
                          : deviceWidth * 0.03, //14,12
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(25, 25, 25, 1),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ///EDIT
              title != ""
                  ? GestureDetector(
                      child: Text(
                        "Edit",
                        style: GoogleFonts.sora(
                          fontSize: deviceWidth * 0.035, //14
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(29, 98, 202, 1),
                        ),
                      ),
                    )
                  : GestureDetector(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color.fromRGBO(83, 93, 102, 1),
                        size: deviceWidth * 0.03,
                      ),
                    )
            ],
          ),
        ),
      ],
    );
  }
}
