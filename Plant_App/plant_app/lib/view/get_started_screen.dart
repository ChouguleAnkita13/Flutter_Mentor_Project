import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/view/custom_container.dart';
import 'package:plant_app/view/LoginScreen/login_screen.dart';
///WIDGET TO DISPLAY GET STARTED SCREEN
class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.sizeOf(context).height;
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///IMAGE
          Image.asset(
            "assets/images/getstarted.png",
            fit: BoxFit.cover,
            height: deviceHeight / 1.5,
            width: deviceWidth,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///TEXT
              Text(
                "Enjoy your",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 34, fontWeight: FontWeight.w400)),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "life with ",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.w400)),
                ),
                TextSpan(
                  text: "Plants",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.w600)),
                ),
              ])),
            ],
          ),
          ///BUTTON TO NAVIGATE LOGIN SCREEN
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },

              /// CALLED CUSTOMCONTAINER
              child: const CustomContainer(
                title: "Get Started",
              )),
        ],
      ),
    );
  }
}
