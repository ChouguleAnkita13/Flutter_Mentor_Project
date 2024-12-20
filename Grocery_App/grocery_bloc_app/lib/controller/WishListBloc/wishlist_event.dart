import 'package:grocery_bloc_app/model/product_data_model.dart';

abstract class WishlistEvent {}

///This class representing the event of
///when we enter in wishlistScreen we want our list initially
class WishlistInitialEvent extends WishlistEvent {}

/// A class representing the event of removing item from wishlist.
class WishlistRemoveItemFromWishlistEvent extends WishlistEvent {
  final ProductDataModel product;
  WishlistRemoveItemFromWishlistEvent({required this.product});
}
