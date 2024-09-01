import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_app/model/room_model.dart';

///WIDGET TO DISPLAY BACK BUTTON AND ROOM DETAIL
class DetailRoom extends StatelessWidget {
  const DetailRoom({super.key, required this.selectedRoom});
  final RoomModel selectedRoom;

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: deviceHeight / 4.3,
      child: Column(
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

          ///ROOM NAME
          Text(
            selectedRoom.roomName,
            style: GoogleFonts.inter(

                ///CONDITION CHECKED I.E DEVICE WIDTH GREATER THAN 500
                /// TO DISPLAY TEXT WITHOUT OVERFLOW
                fontSize: deviceWidth > 500
                    ? deviceWidth * 0.04
                    : deviceWidth * 0.06, //14,24
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(255, 255, 255, 1)),
          ),

          ///TEXTSPAN FOR ROOM DETAILS
          SizedBox(
              width: deviceWidth * 0.8,
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Your ${selectedRoom.roomName} has",
                  style: GoogleFonts.inter(
                      fontSize: deviceWidth > 500
                          ? deviceWidth * 0.03
                          : deviceWidth * 0.045, //12 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
                TextSpan(
                  text: " 4 devices ",
                  style: GoogleFonts.inter(
                      fontSize: deviceWidth > 500
                          ? deviceWidth * 0.03
                          : deviceWidth * 0.045, // 18,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1)),
                ),
                TextSpan(
                  text:
                      "connected to the home network. You can configure them by connecting to the home network.",
                  style: GoogleFonts.inter(
                      fontSize: deviceWidth > 500
                          ? deviceWidth * 0.03
                          : deviceWidth * 0.045, // 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
              ]))),
        ],
      ),
    );
  }
}
