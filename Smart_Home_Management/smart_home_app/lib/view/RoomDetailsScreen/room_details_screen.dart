import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_app/view/RoomDetailsScreen/Widgets/detail_room.dart';
import 'package:smart_home_app/view/RoomDetailsScreen/Widgets/devices.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/room_controller.dart';
import 'package:smart_home_app/model/room_model.dart';

///WIDGET TO DISPLAY THE DETAILS OF ROOM WITH DEVICES
class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

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
          Image.asset(selectedRoom.roomImg,
              height: height, width: width, fit: BoxFit.cover),
          Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromRGBO(255, 255, 255, 0.30),
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.075, top: height * 0.02),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///DETAILSROOM() WIDGET,TO SHOW BACK BUTTON,ROOM NAME AND DETAIL
                      DetailRoom(selectedRoom: selectedRoom),
                      SizedBox(
                        height: height * 0.06,
                      ),

                      ///DEVICES() WIDGET,TO SHOW ALL DEVICES
                      const Devices()
                    ]),
              ))
        ],
      ),
    );
  }
}