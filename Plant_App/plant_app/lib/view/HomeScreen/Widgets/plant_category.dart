import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/controller/plant_controller.dart';
import 'package:provider/provider.dart';

import '../../DetailsScreen/details_screen.dart';

/// List view displaying a list of plants.
class PlantCategory extends StatelessWidget {
  const PlantCategory({super.key});
  @override
  Widget build(BuildContext context) {
    log("In PlantCategory build");
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 1.7,
        child: Consumer<PlantController>(
            // The Consumer widget listens to changes in the PlantController

            builder: (context, plantController, snapshot) {
          final List plantList = plantController.plantList;
          log("In Consumer PlantController");

          return ListView.separated(
            itemCount: plantList.length,
            itemBuilder: ((context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Plant type
                  Text(
                    plantList[index].type,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                  //to display list of plantdata
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
                                //Plant Image
                                GestureDetector(
                                  onTap: () {
                                    // Set the selected plant and navigate to the details screen

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
                                //Plant Name
                                Text(
                                  plantList[index].plantData[idx].plantName,
                                  style: GoogleFonts.dmSans(
                                      textStyle: const TextStyle(
                                          color: Color.fromRGBO(48, 48, 48, 1),
                                          fontSize: 13.16,
                                          fontWeight: FontWeight.w400)),
                                ),
                                //Plant Price and button
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
            //seperator line
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
