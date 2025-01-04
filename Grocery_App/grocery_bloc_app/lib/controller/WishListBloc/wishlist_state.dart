import 'package:grocery_bloc_app/model/product_data_model.dart';

abstract class WishlistState {}

///Initial state
/// The initial state of the wishlist when the app starts or resets.
class WishlistInitialState extends WishlistState {}

///This State is for ActionStates like onclick event it shows snackbar/dialogbox/bottomsheet/navigation actions
class WishlistActionState extends WishlistState {}

///This state is for building loading state before data comes from/server/backend
class WishlistLoadingState extends WishlistState {}

///This state is for building Success state after data loaded succssfully from list/ sever/backend
class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> products;
  WishlistSuccessState({required this.products});
}

///This Action state is for showing some Action after item removing from list/server/backend
class WishlistRemoveItemFromWishlistActionState extends WishlistActionState {
  final String message;

  WishlistRemoveItemFromWishlistActionState({required this.message});
}

///This Action state is for showing some Action after item adding to list/server/backend

class WishlistAllAddToCartActionState extends WishlistActionState {
  final String message;

  WishlistAllAddToCartActionState({required this.message});
}
