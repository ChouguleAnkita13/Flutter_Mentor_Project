import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/device_operator.dart';

///WIDGET TO DISPLAY VOLUMN,WIFI AND TIMER
class VolumnWifiTime extends StatelessWidget {
  const VolumnWifiTime({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        ///VOLUME
        Container(
          height: height * 0.186,
          width: width * 0.2,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.41),
                  Color.fromRGBO(255, 255, 255, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.4, 0.4]),
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(width * 0.05),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "60%",
                style: GoogleFonts.inter(
                    fontSize: width * 0.04, //12
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(90, 90, 90, 1)),
              ),
              Image.asset("assets/images/music.png",
                  width: width * 0.08,
                  height: width * 0.08,
                  color: const Color.fromRGBO(90, 90, 90, 1)),
            ],
          ),
        ),
        SizedBox(width: width * 0.05),

        ///WIFI AND ALARAM BUTTONS
        Column(
          children: [
            ///WIFI BUTTON
            Consumer<DeviceOperator>(
              builder: (context, deviceOperator, snapshot) {
                return GestureDetector(
                  onTap: (){
                    ///TOGGLE WIFI STATE USING PROVIDER
                     deviceOperator.toggleWiFi();
                  },
                  child: Container(
                    height: height * 0.085,
                    width: width * 0.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: deviceOperator.isWifiOn? const Color.fromRGBO(255, 255, 255, 1):
                      const Color.fromRGBO(255, 255, 255, 0.41),
                      borderRadius: BorderRadius.circular(width * 0.05),
                    ),
                    child: Icon(
                      Icons.wifi,
                      color: deviceOperator.isWifiOn? const Color.fromRGBO(90, 90, 90, 1):const Color.fromRGBO(255, 255, 255, 1),
                      size: width * 0.08,
                    ),
                  ),
                );
              }
            ),
            SizedBox(height: height * 0.008),

            /// ALARAM BUTTON
           Consumer<DeviceOperator>(
              builder: (context, deviceOperator, child) {
                return GestureDetector(
                  onTap: () {
                    ///TOGGLE ALARAM STATE USING PROVIDER
                     deviceOperator.toggleAlarm(); 
                  },
                  child: Container(
                    height: height * 0.085,
                    width: width * 0.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:  deviceOperator.isAlarmOn
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(200, 200, 200, 0.41),
                      borderRadius: BorderRadius.circular(width * 0.05),
                    ),
                    child: Icon(
                      Icons.alarm,
                      color:  deviceOperator.isAlarmOn
                          ? 
                           const Color.fromRGBO(90, 90, 90, 1):const Color.fromRGBO(255, 255, 255, 1),
                      size: width * 0.08,
                    ),
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
