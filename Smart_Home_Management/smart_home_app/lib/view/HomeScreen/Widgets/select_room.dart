import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/room_controller.dart';

///WIDGET TO DISPLAYING LIST OF ROOMS
class SelectRoom extends StatelessWidget {
  const SelectRoom({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    // log("$width * $height");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///SELECT ROOM TEXT
        Text(
          "Select Room",
          style: GoogleFonts.inter(
              fontSize: width * 0.05, //20.6
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
        SizedBox(height: height * 0.022),
        SizedBox(
            height: height / 3.5,
            child: Consumer<RoomController>(

                /// THE CONSUMER WIDGET LISTENS TO CHANGES IN THE ROOMCONTROLLER
                builder: (context, roomController, snapshot) {
              ///LIST OF ROOMS
              final List roomsList = roomController.roomList;

              ///DISPLAY ALL ROOMS FROM ROOMSLIST
              return ListView.separated(
                  itemCount: roomsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ///SET THE SELECTED ROOM
                        roomController.selectRoom(roomsList[index]);
                      },
                      child: Stack(
                        children: [
                          ///ROOM IMAGE
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(roomsList[index].roomImg,
                                height: height / 3.5,
                                width: roomController.selectedRoom ==
                                        roomsList[index]
                                    ? width * 0.3
                                    : width * 0.23,
                                fit: BoxFit.cover),
                          ),

                          ///THE CONTAINER TO SHOW SELECTED ROOM
                          roomController.selectedRoom == roomsList[index]
                              ? Container(
                                  height: height / 3.5,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.49),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(height: height * 0.06),

                                        ///ROOM IMAGE

                                        Text(
                                          roomsList[index].roomName,
                                          style: GoogleFonts.inter(
                                              fontSize: width * 0.045,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1)),
                                        ),

                                        ///BUTTON TO NAVIGATE ROOMDETAILS()
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: height * 0.045,
                                            width: width * 0.25,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              "View",
                                              style: GoogleFonts.inter(
                                                  fontSize:
                                                      width * 0.036, //16.06
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1)),
                                            ),
                                          ),
                                        )
                                      ]))

                              ///DISPLAY UNSELECTED ROOMS
                              : Positioned(
                                  bottom: 10,
                                  left: 10,

                                  ///ROOM IMAGE
                                  child: Text(
                                    roomsList[index].roomName,
                                    style: GoogleFonts.inter(
                                        fontSize: width * 0.037, //15
                                        fontWeight: FontWeight.w500,
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, idx) => SizedBox(
                        width: width * 0.03,
                      ));
            }))
      ],
    );
  }
}
