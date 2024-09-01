import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY LAYOUT FOR CUSTOM BOTTOMSHEET
class BottomsheetLayout extends StatelessWidget {
  const BottomsheetLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    final double deviceWidth = MediaQuery.sizeOf(context).width;

    ///BOTTOMSHEET CONTAINER
    return Container(
      height: deviceHeight * 0.23,
      width: deviceWidth,
      padding: EdgeInsets.only(
          top: deviceHeight * 0.009,
          left: deviceWidth * 0.07,
          bottom: deviceHeight * 0.06,
          right: deviceWidth * 0.07),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(deviceWidth * 0.06),
              topRight: Radius.circular(deviceWidth * 0.06)),
          color: const Color.fromRGBO(0, 0, 0, 0.39)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///SMALL LINE
          Center(
            child: Container(
              height: deviceHeight * 0.006,
              width: deviceWidth * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(255, 255, 255, 0.37),
              ),
            ),
          ),

          ///POWER CONSUMPTION TEXT
          Text(
            "Power Consumption",
            style: GoogleFonts.inter(

                ///CONDITION CHECKED I.E DEVICE WIDTH GREATER THAN 500
                /// TO DISPLAY TEXT WITHOUT OVERFLOW
                fontSize: deviceWidth > 500
                    ? deviceWidth * 0.035
                    : deviceWidth * 0.05, //20.6
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(255, 255, 255, 1)),
          ),

          ///ROW TO DISPLAY TOTAL POWER SUPPLY
          Row(
            children: [
              Text(
                "Total Supply",
                style: GoogleFonts.inter(
                    fontSize: deviceWidth > 500
                        ? deviceWidth * 0.03
                        : deviceWidth * 0.036, //
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(204, 204, 204, 1)),
              ),
              const Spacer(),
              Text(
                "500 W",
                style: GoogleFonts.inter(
                    fontSize: deviceWidth > 500
                        ? deviceWidth * 0.03
                        : deviceWidth * 0.036, //
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(204, 204, 204, 1)),
              ),
            ],
          ),

          ///ROW TO DISPLAY TOTAL POWER SAVING
          Row(
            children: [
              Text(
                "Total Savings",
                style: GoogleFonts.inter(
                    fontSize: deviceWidth > 500
                        ? deviceWidth * 0.03
                        : deviceWidth * 0.036, //
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(204, 204, 204, 1)),
              ),
              const Spacer(),
              Text(
                "19%",
                style: GoogleFonts.inter(
                    fontSize: deviceWidth > 500
                        ? deviceWidth * 0.03
                        : deviceWidth * 0.036, //
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(204, 204, 204, 1)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
