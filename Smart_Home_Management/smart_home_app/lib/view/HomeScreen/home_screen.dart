import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_app/view/HomeScreen/Widgets/master_switch.dart';
import 'package:smart_home_app/view/HomeScreen/Widgets/select_room.dart';
import 'package:smart_home_app/view/HomeScreen/Widgets/temp_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          //Screen background image
          Image.asset("assets/images/home.png",
              height: height, width: width, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.notes,
                  size: 30,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                Text(
                  "Hi Ankita",
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
                Text(
                  "Welcome to your smart home",
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  //To display temprature,TempContainer() widget called
                  child: TempContainer(),
                ),
                //MasterSwitch() widget
                const MasterSwitch(),
                //SelectRoom() widget
                const SelectRoom(),
                //
                Center(
                  child: Container(
                    width: width / 2,
                    height: 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 255, 255, 0.58)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
