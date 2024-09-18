import 'package:flutter/material.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:plant_app/model/plantdata_model.dart';

/// CONTROLLER FOR MANAGING PLANT DATA AND THE SELECTED PLANT.
///
/// THIS CLASS EXTENDS [ChangeNotifier] TO NOTIFY LISTENERS WHEN THE SELECTED ITEM CHANGES.
class PlantController extends ChangeNotifier {
  /// LIST OF PLANTS WITH THEIR CATEGORIES
  final List<PlantModel> plantList = [
    const PlantModel(type: "Indoor", plantData: [
      PlantdataModel(
          id: 1,
          plantImg: "assets/images/snakePlant.png",
          plantName: "Snake Plants",
          price: 350),
      PlantdataModel(
          id: 2,
          plantImg: "assets/images/snakePlant.png",
          plantName: "Snake Plants",
          price: 350),
      PlantdataModel(
          id: 3,
          plantImg: "assets/images/snakePlant.png",
          plantName: "Snake Plants",
          price: 350),
      PlantdataModel(
          id: 4,
          plantImg: "assets/images/snakePlant.png",
          plantName: "Snake Plants",
          price: 350),
    ]),
    const PlantModel(type: "Outdoor", plantData: [
      PlantdataModel(
          id: 5,
          plantImg: "assets/images/snakePlant.png",
          plantName: "Snake Plants",
          price: 350),
      PlantdataModel(
          id: 6,
          plantImg: "assets/images/snakePlant.png",
          plantName: "Snake Plants",
          price: 350),
      PlantdataModel(
          id: 7,
          plantImg: "assets/images/snakePlant.png",
          plantName: "Snake Plants",
          price: 350),
      PlantdataModel(
          id: 8,
          plantImg: "assets/images/snakePlant.png",
          plantName: "Snake Plants",
          price: 350),
    ])
  ];

  /// CURRENTLY SELECTED PLANT
  PlantdataModel? _selectedPlant;

  /// GETTER FOR THE SELECTED PLANT
  PlantdataModel? get selectedPlant => _selectedPlant;

  /// SETS THE CURRENTLY SELECTED PLANT AND NOTIFIES LISTENERS.
  void selectPlant(PlantdataModel plant) {
    _selectedPlant = plant;
    notifyListeners();
  }
}
