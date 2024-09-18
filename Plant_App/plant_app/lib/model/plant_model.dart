import 'package:plant_app/model/plantdata_model.dart';

/// MODEL REPRESENTING A CATEGORY OF PLANTS.
class PlantModel {
  final String type; /// TYPE OF PLANTS, E.G., "INDOOR" OR "OUTDOOR"
  final List<PlantdataModel> plantData; /// LIST OF PLANTS UNDER THIS CATEGORY

  const PlantModel({
    required this.type,
    required this.plantData,
  });
}
