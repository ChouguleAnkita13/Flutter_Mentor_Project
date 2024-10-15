import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_app/view/RoomDetailsScreen/Widgets/detail_room.dart';
import 'package:smart_home_app/view/RoomDetailsScreen/Widgets/devices.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/room_controller.dart';
import 'package:smart_home_app/model/room_model.dart';
import 'package:blur/blur.dart';

///WIDGET TO DISPLAY THE DETAILS OF ROOM WITH DEVICES
class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    final double deviceWidth = MediaQuery.sizeOf(context).width;

    ///TO GET SELECTEDROOM CHANGENOTIFIERPROVIDER USED
    final RoomModel? selectedRoom =
        Provider.of<RoomController>(context).selectedRoom;

    ///TO DISPLAY WHEN NO ROOM SELECTED
    if (selectedRoom == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///TEXT
          Text("No Room Selected",
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
          Image.asset(selectedRoom.roomImg,
                  height: deviceHeight, width: deviceWidth, fit: BoxFit.cover)
              .blurred(
            colorOpacity: 0.1,
          ),
          Container(
            color: const Color.fromRGBO(40, 22, 0, 0.25),
            child: Padding(
              padding: EdgeInsets.only(
                  left: deviceWidth * 0.07, top: deviceHeight * 0.03),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///DETAILSROOM() WIDGET,TO SHOW BACK BUTTON,ROOM NAME AND DETAIL
                    DetailRoom(selectedRoom: selectedRoom),
                    SizedBox(
                      height: deviceHeight * 0.06,
                    ),

                    ///DEVICES() WIDGET,TO SHOW ALL DEVICES
                    const Devices()
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
