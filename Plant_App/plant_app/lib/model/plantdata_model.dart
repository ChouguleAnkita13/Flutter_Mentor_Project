/// MODEL REPRESENTING A SINGLE PLANT DATA ITEM.
class PlantdataModel {
  final int id;             // UNIQUE IDENTIFIER FOR THE PLANT
  final String plantImg;    // URL OR ASSET PATH TO THE PLANT IMAGE
  final String plantName;   // NAME OF THE PLANT
  final double price;       // PRICE OF THE PLANT

  const PlantdataModel({
    required this.id,
    required this.plantImg,
    required this.plantName,
    required this.price,
  });
}