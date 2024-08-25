/// Model representing a single plant data item.
class PlantdataModel {
  final int id;             // Unique identifier for the plant
  final String plantImg;    // URL or asset path to the plant image
  final String plantName;   // Name of the plant
  final double price;       // Price of the plant

  const PlantdataModel({
    required this.id,
    required this.plantImg,
    required this.plantName,
    required this.price,
  });
}