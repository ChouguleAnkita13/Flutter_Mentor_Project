import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/view/DetailsScreen/Widgets/plant_details_container.dart';
import 'package:plant_app/view/DetailsScreen/Widgets/plant_image_scroll.dart';
import 'package:plant_app/controller/plant_controller.dart';
import 'package:provider/provider.dart';

/// A SCREEN THAT DISPLAYS DETAILED INFORMATION ABOUT A SELECTED PLANT.
///
/// IT INCLUDES A SCROLLING IMAGE CAROUSEL AND DETAILED PLANT INFORMATION.
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    /// RETRIEVE THE SELECTED PLANT FROM THE PROVIDER
    final selectedPlant = Provider.of<PlantController>(context).selectedPlant;
    /// CHECK IF A PLANT IS SELECTED
    if (selectedPlant == null) {
      return const Scaffold(
        body: Center(child: Text('No plant selected')),
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// BACKWARD ARROW TO NAVIGATE TO THE PREVIOUS SCREEN
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(62, 102, 24, 1),
                size: 24,
              ),
            ),
          ),
          /// PLANT IMAGE CAROUSEL WITH THE SELECTED PLANT'S IMAGES
          PlantImageScroll(selectedPlant: selectedPlant),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    selectedPlant.plantName,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    child: Text(
                      "Plansts make your life with minimal and happy love the plants more and enjoy life.",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color.fromRGBO(48, 48, 48, 1),
                              fontSize: 13,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  /// TO DISPLAY ADDITIONAL DETAILS OF PLANT ,PLANTDETAILSCONTAINER() CALLED
                  const PlantDetailsContainer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
