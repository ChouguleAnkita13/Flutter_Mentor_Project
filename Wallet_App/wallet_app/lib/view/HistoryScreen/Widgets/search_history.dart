import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY "HISTORY" TEXT AND SEARCH HISTORY TEXTFIELD
class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    return Padding(
      padding: EdgeInsets.only(
          left: deviceWidth * 0.044,
          right: deviceWidth * 0.044,
          top: deviceHeight * 0.06,
          bottom: deviceHeight * 0.006),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///TEXT
          Text(
            "History",
            style: GoogleFonts.sora(
              fontSize: deviceWidth < 500
                  ? deviceWidth * 0.07
                  : deviceWidth * 0.05, //24,18
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(25, 25, 25, 1),
            ),
          ),
          SizedBox(height: deviceHeight * 0.008),
          Form(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                ///SEARCH TEXTFIELD
                SizedBox(
                  height: deviceHeight * 0.04, //37
                  width: deviceWidth / 1.6,
                  child: TextFormField(
                    cursorColor: const Color.fromRGBO(83, 93, 102, 1),
                    decoration: InputDecoration(

                        ///HINTTEXT
                        hintText: "Value goes here",
                        hintStyle: GoogleFonts.sora(
                          fontSize: deviceWidth * 0.035, //12
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(186, 194, 199, 1),
                        ),

                        ///SEARCH ICON
                        prefixIcon: Image.asset("assets/icons/search.png"),

                        ///ALL BORDER DECORATION FOR TEXTFIELD
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(225, 227, 237, 1),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(225, 227, 237, 1),
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(225, 227, 237, 1),
                            ))),
                  ),
                ),

                ///FILTER TEXTFIELD
                SizedBox(
                  height: deviceHeight * 0.04, //37
                  width: deviceWidth / 4,
                  child: TextFormField(
                    cursorColor: const Color.fromRGBO(83, 93, 102, 1),
                    decoration: InputDecoration(

                        ///HINTTEXT
                        hintText: "Filter",
                        hintStyle: GoogleFonts.sora(
                          fontSize: deviceWidth * 0.035, //12
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),

                        ///FILTER ICON
                        prefixIcon:
                            Image.asset("assets/icons/equalizer-line.png"),

                        ///ALL BORDER DECORATION FOR TEXTFIELD
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(225, 227, 237, 1),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(225, 227, 237, 1),
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(225, 227, 237, 1),
                            ))),
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
