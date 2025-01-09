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
  bool isFev;
  bool isAddToCart;
  int numberOfItems;

  ProductDataModel(
      {required this.id,
      required this.name,
      required this.isFev,
      required this.isAddToCart,
      required this.category,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.numberOfItems,
      required this.quantity});

  // Convert to Map
  Map<String, dynamic> productDataModelMap() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'isFev': isFev,
      'isAddToCart': isAddToCart,
      'numberOfItems': numberOfItems,
    };
  }
}
