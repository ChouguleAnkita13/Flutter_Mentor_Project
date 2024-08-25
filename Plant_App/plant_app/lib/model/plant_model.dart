import 'package:plant_app/model/plantdata_model.dart';

/// Model representing a category of plants.
class PlantModel {
  final String type;                 // Type of plants, e.g., "Indoor" or "Outdoor"
  final List<PlantdataModel> plantData;  // List of plants under this category

  const PlantModel({
    required this.type,
    required this.plantData,
  });
}