import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
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
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(productDataModel.name,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productDataModel.description),
          const SizedBox(height: 5),
          Row(
            children: [
              Text("\$${productDataModel.price}",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(width: 110),
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
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25,
                    )),
              )

              // IconButton(
              //     onPressed: () {
              //       homeBloc.add(HomeProductCartButtonClickedEvent(
              //           clickedProduct: productDataModel));
              //     },
              // icon: const Icon(
              //   Icons.shopping_cart_rounded,
              //   color: Color.fromRGBO(14, 161, 125, 1),
              //   size: 30,
              // )
              // )
            ],
          ),
        ],
      ),
    );
  }
}
