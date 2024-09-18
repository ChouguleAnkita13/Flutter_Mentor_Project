import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/// A WIDGET THAT DISPLAYS ADDITIONAL DETAILS OF PLANT.
class PlantDetailsContainer extends StatelessWidget {
  const PlantDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height / 4,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(118, 152, 75, 1)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 15, right: 10, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// PLANT HEIGHT,TEMPRATURE,CIRAMIC POT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///PLANT HEIGHT
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/height.png",
                        width: 24,
                        height: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Height",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "30cm-40cm",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.6)),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  ///TEMPERATURE
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/thermometer.png",
                        height: 34,
                        width: 34,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Temperature",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "20’C-25’C",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.6)),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  /// CIRAMIC POT
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/pot.png",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Pot",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Ciramic Pot",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.6)),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              ///TOTAL PRICE AND ADD TO CARD BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///TOTAL PRICE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.8)),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "₹ 350",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.8)),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  ///ADD TO CART BUTTON
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / 3,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(103, 133, 74, 1),
                          borderRadius: BorderRadius.circular(8.06)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/shopping-bag.png",
                            height: 19.35,
                            width: 19.35,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add to cart",
                            style: GoogleFonts.rubik(
                                textStyle: const TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                fontSize: 14.52,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
