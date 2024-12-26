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
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width - 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productDataModel.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text("\$${productDataModel.price} Price:",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          const Spacer(),
          Text("\$${productDataModel.price}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(width: 10),
          GestureDetector(
              onTap: () {
                wishlistBloc.add(WishlistRemoveItemFromWishlistEvent(
                    product: productDataModel));
              },
              child: const Icon(Icons.cancel_outlined)),
        ],
      ),
    );
  }
}
