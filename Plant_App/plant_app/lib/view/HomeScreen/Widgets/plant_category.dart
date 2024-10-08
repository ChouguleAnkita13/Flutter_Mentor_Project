import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/controller/plant_controller.dart';
import 'package:provider/provider.dart';

import '../../DetailsScreen/details_screen.dart';

///WIDGET TO DISPLAY LIST OF PLANTES WITH CATEGORIES
class PlantCategory extends StatelessWidget {
  const PlantCategory({super.key});
  @override
  Widget build(BuildContext context) {
    log("In PlantCategory build");
    final deviceHeight = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: deviceHeight / 1.7,
        child: Consumer<PlantController>(

            /// THE CONSUMER WIDGET LISTENS TO CHANGES IN THE PLANTCONTROLLER

            builder: (context, plantController, snapshot) {
          final List plantList = plantController.plantList;
          log("In Consumer PlantController");

          /// LIST VIEW DISPLAYING A LIST OF PLANTS.
          return ListView.separated(
            itemCount: plantList.length,
            itemBuilder: ((context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///PLANT TYPE
                  Text(
                    plantList[index].type,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),

                  ///TO DISPLAY LIST OF PLANTDATA
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: plantList[index].plantData.length,
                        itemBuilder: (context, idx) {
                          return Container(
                            width: 141,
                            height: 188,
                            margin: const EdgeInsets.only(
                                right: 12, top: 10, bottom: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.06),
                                    offset: Offset(0, 7.52),
                                    blurRadius: 18.8)
                              ],
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///PLANT IMAGE
                                GestureDetector(
                                  onTap: () {
                                    /// SET THE SELECTED PLANT AND NAVIGATE TO THE DETAILS SCREEN

                                    plantController.selectPlant(
                                        plantList[index].plantData[idx]);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailScreen()));
                                  },
                                  child: SizedBox(
                                    width: 100,
                                    height: 112,
                                    child: Image.asset(
                                      plantList[index].plantData[idx].plantImg,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                ///PLANT NAME
                                Text(
                                  plantList[index].plantData[idx].plantName,
                                  style: GoogleFonts.dmSans(
                                      textStyle: const TextStyle(
                                          color: Color.fromRGBO(48, 48, 48, 1),
                                          fontSize: 13.16,
                                          fontWeight: FontWeight.w400)),
                                ),

                                ///PLANT PRICE AND BUTTON
                                Row(
                                  children: [
                                    Text(
                                      "₹${plantList[index].plantData[idx].price}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Color.fromRGBO(
                                                  62, 102, 24, 1),
                                              fontSize: 16.92,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: const Color.fromRGBO(
                                              237, 238, 235, 1)),
                                      child: Image.asset(
                                        "assets/images/shopping-bag.png",
                                        width: 14,
                                        height: 14,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              );
            }),

            ///SEPERATOR LINE
            separatorBuilder: ((context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 10, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(204, 211, 196, 1),
                        width: 1)),
              );
            }),
          );
        }),
      ),
    );
  }
}
