import 'package:flutter/material.dart';
import 'package:grocery_bloc_app/controller/WishListBloc/wishlist_bloc.dart';
import 'package:grocery_bloc_app/controller/WishListBloc/wishlist_event.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';

class WishlistTileWidget extends StatelessWidget {
  const WishlistTileWidget(
      {super.key, required this.wishlistBloc, required this.productDataModel});
  final WishlistBloc wishlistBloc;
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Text(productDataModel.name,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${productDataModel.price}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {
                    wishlistBloc.add(WishlistRemoveItemFromWishlistEvent(
                        product: productDataModel));
                  },
                  icon: const Icon(Icons.cancel_outlined)),
            ],
          ),
        ],
      ),
    );
  }
}
