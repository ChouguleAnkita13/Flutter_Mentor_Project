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
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.075, top: height * 0.02, right: width * 0.075),
      child: SizedBox(
        height: height / 6,

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
                  size: width * 0.06,
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
                        fontSize: width > 500 ? width * 0.04 : width * 0.06,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  const Spacer(),

                  ///SWITCH
                  SizedBox(
                    height: height * 0.035,
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
                width: width * 0.8,
                child: Text(
                  "${roomController.selectedDevice!.deviceName} is up and running. Control other devices by commanding ${roomController.selectedDevice!.deviceName}.",
                  style: GoogleFonts.inter(
                      fontSize:
                          width > 500 ? width * 0.03 : width * 0.045, //12 18
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
