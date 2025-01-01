import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_wishlist_data.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';

class ProductTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTile(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 200,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                homeBloc.add(HomeProductCartButtonClickedEvent(
                    clickedProduct: productDataModel));
              },
              child: const Icon(Icons.shopping_cart_outlined,
                  color: Color.fromRGBO(14, 161, 125, 1), size: 28),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(productDataModel.name,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Text("${productDataModel.quantity} ,price",
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500])),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${productDataModel.price}",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  homeBloc.add(HomeProductWishlistButtonClickedEvent(
                      clickedProduct: productDataModel));
                },
                child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(14, 161, 125, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      FirebaseWishlistData.fevIdList
                              .contains(productDataModel.id)
                          ? Icons.remove
                          : Icons.add,
                      color: Colors.white,
                      size: 25,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
