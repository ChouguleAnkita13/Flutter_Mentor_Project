import 'package:flutter/material.dart';
import 'package:smart_home_app/view/DeviceDetailsScreen/Widgets/detail_device.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/room_controller.dart';
import 'package:smart_home_app/model/device_model.dart';
import 'package:smart_home_app/model/room_model.dart';
import 'package:smart_home_app/view/DeviceDetailsScreen/Widgets/device_info.dart';
import 'package:blur/blur.dart';

///WIDGET TO DISPLAY DETAILS OF SELECTEDDEVICE FOR SELECTEDROOM
class DeviceDetailsScreen extends StatelessWidget {
  const DeviceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    final double deviceWidth = MediaQuery.sizeOf(context).width;

    ///TO GET SELECTEDROOM AND SELECTEDDEEVICE CHANGENOTIFIERPROVIDER USED

    final RoomModel? selectedRoom =
        Provider.of<RoomController>(context).selectedRoom;
    final DeviceModel? selectedDevice =
        Provider.of<RoomController>(context).selectedDevice;

    ///TO DISPLAY WHEN NO DEVICE SELECTED

    if (selectedDevice == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///TEXT
          Text("No Device Selected",
              style: GoogleFonts.inter(
                  fontSize: deviceWidth * 0.07,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1))),

          ///BUTTON TO NAVIGATE TO HOMESCREEN()
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("home");
            },
            child: Container(
              height: deviceHeight * 0.045,
              width: deviceWidth * 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "BACK TO HOME",
                style: GoogleFonts.inter(
                    fontSize: deviceWidth * 0.036, //16.06
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          ///ROOM IMAGE
          Blur(
            colorOpacity: 0.1,
            child: Image.asset(selectedRoom!.roomImg,
                height: deviceHeight, width: deviceWidth, fit: BoxFit.cover),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///DEVICEINFO() WIDGET,TO SHOW BACK BUTTON,DEVICE NAME AND DETAIL
            const DeviceInfo(),
            SizedBox(
              height: deviceHeight * 0.045,
            ),

            ///DETAILDEVICES() WIDGET,TO SHOW ALL DETAILS OF DEVICE
            DetailDevice(selectedDevice: selectedDevice),
          ])
        ],
      ),
    );
  }
}
