import 'package:flutter/material.dart';
import 'package:smart_home_app/view/HomeScreen/Widgets/greetings.dart';
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
          ///SCREEN BACKGROUND IMAGE
          Image.asset("assets/images/home.png",
              height: height, width: width, fit: BoxFit.cover),
          Padding(
            padding:  EdgeInsets.only(left: width * 0.075),//18,30
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///GREETTINGS() WIDGET,TO SHOW BUTTON AND GREETINGS
                const Greetings(),

                const Align(
                  alignment: Alignment.centerRight,
                  ///TO DISPLAY TEMPRATURE,TEMPCONTAINER() WIDGET CALLED

                  child: TempContainer(),
                ),
                ///MASTERSWITCH() WIDGET
                const MasterSwitch(),
                ///SELECTROOM() WIDGET
                const SelectRoom(),
                //BOTTOM LINE ON SCREEN
                Center(
                  child: Container(
                    width: width / 2,
                    height: height*0.005,
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
