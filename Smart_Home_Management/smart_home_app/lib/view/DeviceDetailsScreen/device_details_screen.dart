import 'package:flutter/material.dart';
import 'package:smart_home_app/view/DeviceDetailsScreen/Widgets/detail_device.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/room_controller.dart';
import 'package:smart_home_app/model/device_model.dart';
import 'package:smart_home_app/model/room_model.dart';
import 'package:smart_home_app/view/DeviceDetailsScreen/Widgets/device_info.dart';
///WIDGET TO DISPLAY DETAILS OF SELECTEDDEVICE FOR SELECTEDROOM
class DeviceDetailsScreen extends StatelessWidget {
  const DeviceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

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
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1))),

          ///BUTTON TO NAVIGATE TO HOMESCREEN()
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("home");
            },
            child: Container(
              height: height * 0.045,
              width: width * 0.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "BACK TO HOME",
                style: GoogleFonts.inter(
                    fontSize: width * 0.036, //16.06
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
          Image.asset(selectedRoom!.roomImg,
              height: height, width: width, fit: BoxFit.cover),
          Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromRGBO(255, 255, 255, 0.30).withOpacity(0.2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///DEVICEINFO() WIDGET,TO SHOW BACK BUTTON,DEVICE NAME AND DETAIL
                    const DeviceInfo(),
                    SizedBox(
                      height: height * 0.045,
                    ),

                    ///DETAILDEVICES() WIDGET,TO SHOW ALL DETAILS OF DEVICE
                    DetailDevice(selectedDevice: selectedDevice),
                  ]))
        ],
      ),
    );
  }
}
