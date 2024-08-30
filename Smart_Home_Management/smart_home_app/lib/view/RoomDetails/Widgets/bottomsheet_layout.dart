import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY LAYOUT FOR CUSTOM BOTTOMSHEET
class BottomsheetLayout extends StatelessWidget {
  const BottomsheetLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    ///BOTTOMSHEET CONTAINER
    return Container(
      height: height * 0.23,
      width: width,
      padding: EdgeInsets.only(
          top: height * 0.009,
          left: width * 0.07,
          bottom: height * 0.06,
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
          ///POWER CONSUMPTION TEXT
          Text(
            "Power Consumption",
            style: GoogleFonts.inter(
                fontSize: width * 0.05, //20.6
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(255, 255, 255, 1)),
          ),
          ///ROW TO DISPLAY TOTAL POWER SUPPLY
          Row(
            children: [
              Text(
                "Total Supply",
                style: GoogleFonts.inter(
                    fontSize: width * 0.036, //20.6
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(204, 204, 204, 1)),
              ),
              const Spacer(),
              Text(
                "500 W",
                style: GoogleFonts.inter(
                    fontSize: width * 0.036, //20.6
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
                    fontSize: width * 0.036, //20.6
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(204, 204, 204, 1)),
              ),
              const Spacer(),
              Text(
                "19%",
                style: GoogleFonts.inter(
                    fontSize: width * 0.036, //20.6
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
