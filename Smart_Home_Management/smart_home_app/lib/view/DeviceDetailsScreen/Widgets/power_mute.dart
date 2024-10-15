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
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: deviceHeight * 0.18,
      padding: EdgeInsets.only(
          top: deviceHeight * 0.015,
          bottom: deviceHeight * 0.015,
          left: deviceWidth * 0.04),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.41),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(deviceWidth * 0.05),
            bottomLeft: Radius.circular(deviceWidth * 0.05)),
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
                    height: deviceHeight * 0.07,
                    width: deviceWidth * 0.15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(deviceWidth * 0.05),
                    ),
                    child: deviceOperator.isMute
                        ? Image.asset("assets/images/mute.png",
                            width: deviceWidth * 0.06,
                            height: deviceWidth * 0.06,
                            color: const Color.fromRGBO(90, 90, 90, 1))
                        : Icon(
                            Icons.volume_mute,
                            color: const Color.fromRGBO(90, 90, 90, 1),
                            size: deviceWidth * 0.08,
                          ),
                  ),
                );
              }),
              SizedBox(
                width: deviceWidth * 0.03,
              ),

              ///MIKE BUTTON
              GestureDetector(
                onTap: () {
                  ///BOTTOMSHEET
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.39),
                      barrierColor: Colors.transparent,
                      builder: (ctx) => const MusicBottomsheet());
                },
                child: Container(
                  height: deviceHeight * 0.07,
                  width: deviceWidth * 0.27,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(deviceWidth * 0.05),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/mike.png",
                          width: deviceWidth * 0.06,
                          height: deviceWidth * 0.06,
                          color: const Color.fromRGBO(90, 90, 90, 1)),
                      Container(
                        height: deviceHeight * 0.004,
                        width: deviceWidth * 0.07,
                        color: const Color.fromRGBO(35, 196, 130, 1),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: deviceHeight * 0.009,
          ),

          ///POWER USAGE
          Container(
            height: deviceHeight * 0.07,
            width: deviceWidth * 0.45,
            padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.03, vertical: deviceHeight * 0.015),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(deviceWidth * 0.05),
            ),
            child: Row(
              children: [
                ///POWER ICON
                Icon(
                  Icons.power_outlined,
                  color: const Color.fromRGBO(90, 90, 90, 1),
                  size: deviceWidth * 0.055,
                ),
                SizedBox(
                  width: deviceWidth * 0.015,
                ),

                ///POWER USAGE TEXT
                SizedBox(
                  width: deviceWidth * 0.1,
                  child: Text(
                    "Power Usage",
                    style: GoogleFonts.inter(
                        fontSize: deviceWidth > 500
                            ? deviceWidth * 0.016
                            : deviceWidth * 0.026, //12
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(90, 90, 90, 1)),
                  ),
                ),
                SizedBox(
                  width: deviceWidth * 0.04,
                ),

                ///VETICAL LINE
                Container(
                    width: deviceWidth * 0.004,
                    color: const Color.fromRGBO(214, 214, 214, 1)),
                SizedBox(
                  width: deviceWidth * 0.04,
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
                          fontSize: deviceWidth > 500
                              ? deviceWidth * 0.016
                              : deviceWidth * 0.026, //12
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(90, 90, 90, 1)),
                    ),
                    Text(
                      "93 kWh",
                      style: GoogleFonts.inter(
                          fontSize: deviceWidth > 500
                              ? deviceWidth * 0.021
                              : deviceWidth * 0.032, //14
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
