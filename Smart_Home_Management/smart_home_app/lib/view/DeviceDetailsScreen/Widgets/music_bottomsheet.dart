import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

///WIDGET TO DISPLAY LAYOUT FOR CUSTOM BOTTOMSHEET FOR MUSIC

class MusicBottomsheet extends StatelessWidget {
  const MusicBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    log("${height * 0.018}");
    log("${width * 0.035}");

    ///BOTTOMSHEET CONTAINER
    return Container(
      height: height * 0.23,
      width: width,
      padding: EdgeInsets.only(
          top: height * 0.009,
          left: width * 0.07,
          bottom: height * 0.05,
          right: width * 0.07),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(width * 0.06),
              topRight: Radius.circular(width * 0.06)),
          color: const Color.fromRGBO(0, 0, 0, 0.39)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///SMALL LINE
          Center(
            child: Container(
              height: height * 0.006,
              width: width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(255, 255, 255, 0.37),
              ),
            ),
          ),

          ///
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///SONG IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(width * 0.03),
                child: Image.asset(
                  "assets/images/starboy.png",
                  height: height * 0.062, //56
                  width: width * 0.14, //57
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: width * 0.02),

              ///SONG NAME
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I Feel It Coming",
                    style: GoogleFonts.inter(

                        ///CONDITION CHECKED I.E DEVICE WIDTH GREATER THAN 500
                        /// TO DISPLAY TEXT WITHOUT OVERFLOW
                        fontSize: width > 500
                            ? width * 0.03
                            : width * 0.045, //12, 18,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  Text(
                    "The Weeknd",
                    style: GoogleFonts.inter(
                        fontSize:
                            width > 500 ? width * 0.02 : width * 0.035, //10,14
                        fontWeight: FontWeight.w300,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ],
              ),
              const Spacer(),

              ///UP NEXT MUSIC
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Up next...",
                    style: GoogleFonts.inter(
                        fontSize:
                            width > 500 ? width * 0.02 : width * 0.03, //10,14
                        fontWeight: FontWeight.w300,
                        color: const Color.fromRGBO(205, 205, 205, 1)),
                  ),

                  ///STACK TO DISPLAY NEXT SONG IMAGES
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        child: Image.asset(
                          "assets/images/divide.png",
                          height: height * 0.058, //56
                          width: width * 0.14, //57
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: width * 0.015,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          child: Image.asset(
                            "assets/images/pilots.png",
                            height: height * 0.06, //56
                            width: width * 0.14, //57
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: width * 0.055,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          child: Image.asset(
                            "assets/images/finneas.png",
                            height: height * 0.062, //56
                            width: width * 0.14, //57
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),

          ///PROGRESS INDICATOR
          LinearProgressIndicator(
              minHeight: height * 0.006,
              value: 0.45,
              borderRadius: BorderRadius.circular(5),
              backgroundColor: const Color.fromRGBO(163, 163, 163, 1),
              color: const Color.fromRGBO(255, 255, 255, 1)),

          ///ROW TO DISPLAY PROGRESS TIME
          Row(
            children: [
              Text(
                "1.56",
                style: GoogleFonts.inter(
                    fontSize: width > 500 ? width * 0.02 : width * 0.03, //10,14
                    fontWeight: FontWeight.w300,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
              const Spacer(),
              Text(
                "3.42",
                style: GoogleFonts.inter(
                    fontSize: width > 500 ? width * 0.02 : width * 0.03, //10,14
                    fontWeight: FontWeight.w300,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
            ],
          ),

          ///ROW TO DISPLAY MUSIC PLAY ICONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///PREVIOUS
              GestureDetector(
                onTap: () {},
                child: Image.asset("assets/images/previous.png",
                    height: height * 0.019, //16
                    width: width * 0.036, //14
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),

              ///PLAY
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.play_arrow,
                    size: width * 0.08,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),

              ///NEXT
              GestureDetector(
                child: Image.asset("assets/images/next.png",
                    height: height * 0.019, //16
                    width: width * 0.036, //14
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
