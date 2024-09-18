import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY FIND YOUR FAVORITE PLANT TEXT AND SHOPPING BAG BUTTON
class FindPlantsRow extends StatelessWidget {
  const FindPlantsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          SizedBox(
            width: 185,

            ///TEXT
            child: Text(
              "Find your favorite plants",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          const Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    offset: Offset(0, 4),
                    blurRadius: 16.1)
              ],
              color: Colors.white,
            ),

            ///IMAGE
            child: Image.asset(
              "assets/images/shopping-bag.png",
              color: const Color.fromRGBO(62, 102, 24, 1),
              width: 6.67,
              height: 3.33,
            ),
          ),
        ],
      ),
    );
  }
}
