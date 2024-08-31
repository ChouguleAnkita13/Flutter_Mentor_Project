import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/device_operator.dart';
import 'package:smart_home_app/view/DeviceDetailsScreen/Widgets/music_bottomsheet.dart';

///WIDGET TO DISPLAY POWER USAGE,MUTE BUTTON,MIKE BUTTON

class PowerMute extends StatelessWidget {
  const PowerMute({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.18,
      padding: EdgeInsets.only(
          top: height * 0.015, bottom: height * 0.015, left: width * 0.04),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.41),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(width * 0.05),
            bottomLeft: Radius.circular(width * 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///MUTE AND MIKE BUTTON
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///MUTE BUTTON

              Consumer<DeviceOperator>(
                  builder: (context, deviceOperator, snapshot) {
                return GestureDetector(
                  ///TOGGLE MUTE STATE USING PROVIDER
                  onTap: () {
                    deviceOperator.toggleMute();
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(width * 0.05),
                    ),
                    child: deviceOperator.isMute
                        ? Image.asset("assets/images/mute.png",
                            width: width * 0.06,
                            height: width * 0.06,
                            color: const Color.fromRGBO(90, 90, 90, 1))
                        : Icon(
                            Icons.volume_mute,
                            color: const Color.fromRGBO(90, 90, 90, 1),
                            size: width * 0.08,
                          ),
                  ),
                );
              }),
              SizedBox(
                width: width * 0.03,
              ),

              ///MIKE BUTTON
              GestureDetector(
                onTap: () {
                  ///BOTTOMSHEET
                  showBottomSheet(
                      context: context,
                      builder: (ctx) => const MusicBottomsheet());
                },
                child: Container(
                  height: height * 0.07,
                  width: width * 0.27,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(width * 0.05),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/mike.png",
                          width: width * 0.06,
                          height: width * 0.06,
                          color: const Color.fromRGBO(90, 90, 90, 1)),
                      Container(
                        height: height * 0.004,
                        width: width * 0.07,
                        color: const Color.fromRGBO(35, 196, 130, 1),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.009,
          ),

          ///POWER USAGE
          Container(
            height: height * 0.07,
            width: width * 0.45,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.015),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(width * 0.05),
            ),
            child: Row(
              children: [
                ///POWER ICON
                Icon(
                  Icons.power_outlined,
                  color: const Color.fromRGBO(90, 90, 90, 1),
                  size: width * 0.055,
                ),
                SizedBox(
                  width: width * 0.015,
                ),

                ///POWER USAGE TEXT
                SizedBox(
                  width: width * 0.1,
                  child: Text(
                    "Power Usage",
                    style: GoogleFonts.inter(
                        fontSize:
                            width > 500 ? width * 0.016 : width * 0.026, //12
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(90, 90, 90, 1)),
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),

                ///VETICAL LINE
                Container(
                    width: width * 0.004,
                    color: const Color.fromRGBO(214, 214, 214, 1)),
                SizedBox(
                  width: width * 0.04,
                ),

                ///TODAYS POWER USAGE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today",
                      style: GoogleFonts.inter(

                          ///CONDITION CHECKED I.E DEVICE WIDTH GREATER THAN 500
                          /// TO DISPLAY TEXT WITHOUT OVERFLOW
                          fontSize:
                              width > 500 ? width * 0.016 : width * 0.026, //12
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(90, 90, 90, 1)),
                    ),
                    Text(
                      "93 kWh",
                      style: GoogleFonts.inter(
                          fontSize:
                              width > 500 ? width * 0.021 : width * 0.032, //14
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
