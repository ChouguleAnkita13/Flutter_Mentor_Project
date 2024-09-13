import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/navigation_controller.dart';

/// WIDGET TO SHOW BOTTOM NAVIGATION BAR
class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    log("${deviceWidth * 0.09}");
    log("${deviceHeight * 0.075}");

    /// FINDING THE INSTANCE OF NAVIGATION CONTROLLER USING GETX
    NavigationController navigation = Get.find<NavigationController>();

    return Obx(
      () => Scaffold(
        /// BODY WILL DISPLAY THE CURRENTLY SELECTED SCREEN BASED ON SELECTED INDEX
        body: navigation.widgetList.elementAt(navigation.selectedIndex.value),

        bottomNavigationBar: SizedBox(
          height: deviceHeight * 0.075, //64

          /// BOTTOM NAVIGATION BAR
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/home.png")),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/history.png")),
                label: "History",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/card.png")),
                label: "Card",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/more.png")),
                label: "More",
              ),
            ],

            selectedItemColor: const Color.fromRGBO(111, 69, 233, 1),
            unselectedItemColor: const Color.fromRGBO(83, 93, 102, 1),
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            selectedLabelStyle: GoogleFonts.sora(
                fontWeight: FontWeight.w600, fontSize: deviceWidth * 0.03),
            unselectedLabelStyle: GoogleFonts.sora(
              fontWeight: FontWeight.w400, fontSize: deviceWidth * 0.03, //12
            ),
            type: BottomNavigationBarType.fixed,

            /// CURRENT INDEX BASED ON SELECTED ITEM
            currentIndex: navigation.selectedIndex.value,

            /// FUNCTION TO HANDLE TAP ON NAVIGATION ITEMS
            onTap: navigation.onItemTapped,
          ),
        ),
      ),
    );
  }
}
