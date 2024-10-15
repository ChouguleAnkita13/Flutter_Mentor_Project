import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/device_operator.dart';
import 'package:smart_home_app/controller/room_controller.dart';

///WIDGET TO DISPLAY BACK BUTTON AND DEVICE INFO

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(
          left: deviceWidth * 0.07,
          top: deviceHeight * 0.03,
          right: deviceWidth * 0.07),
      child: SizedBox(
        height: deviceHeight / 5.5,

        ///CONSUMER2 USED FOR 2 CHANGENOTIFIERPROVIDERS
        ///TO USE DATA FROM 2 CONTROLLERS I.E ROOMCONTROLLER AND DEVICEOPERATOR
        child: Consumer2<RoomController, DeviceOperator>(
            builder: (context, roomController, deviceOperator, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///BACK BUTTON
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: deviceWidth * 0.06,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),

              ///DEVICE NAME AND SWITCH
              Row(
                children: [
                  ///DEVICE NAME
                  Text(
                    // selectedDevice.deviceName,
                    roomController.selectedDevice!.deviceName,
                    style: GoogleFonts.inter(

                        ///CONDITION CHECKED I.E DEVICE WIDTH GREATER THAN 500
                        /// TO DISPLAY TEXT WITHOUT OVERFLOW
                        fontSize: deviceWidth > 500
                            ? deviceWidth * 0.04
                            : deviceWidth * 0.06,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  const Spacer(),

                  ///SWITCH
                  SizedBox(
                    height: deviceHeight * 0.035,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                          value: deviceOperator.isSwitchOn,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: const Color.fromRGBO(0, 0, 0, 1),
                          activeTrackColor:
                              const Color.fromRGBO(255, 255, 255, 1),
                          onChanged: (val) {
                            deviceOperator.toggleSwitch();
                          }),
                    ),
                  ),
                ],
              ),

              ///
              SizedBox(
                width: deviceWidth * 0.8,
                child: Text(
                  "${roomController.selectedDevice!.deviceName} is up and running. Control other devices by commanding ${roomController.selectedDevice!.deviceName}.",
                  style: GoogleFonts.inter(
                      fontSize: deviceWidth > 500
                          ? deviceWidth * 0.03
                          : deviceWidth * 0.045, //12 18
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
