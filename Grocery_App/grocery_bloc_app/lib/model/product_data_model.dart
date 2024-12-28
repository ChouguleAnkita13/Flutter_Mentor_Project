class ProductModel {
  final String category;
  final List<ProductDataModel> itemList;
  const ProductModel({
    required this.category,
    required this.itemList,
  });
}

class ProductDataModel {
  final String id;
  final String category;

  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String quantity;
  const ProductDataModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.quantity});
}
