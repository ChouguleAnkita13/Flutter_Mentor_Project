import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_bloc.dart';
import 'package:grocery_bloc_app/controller/CartBloc/cart_event.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget(
      {super.key, required this.cartBloc, required this.productDataModel});
  final CartBloc cartBloc;
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    double price = productDataModel.price * productDataModel.numberOfItems;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productDataModel.name,
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("${productDataModel.quantity}, Price",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[500])),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        cartBloc.add(CartRemoveProductFromCartEvent(
                            product: productDataModel));
                      },
                      child: const Icon(Icons.cancel_outlined,
                          color: Color.fromRGBO(14, 161, 125, 1))),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartBloc.add(DecrementProductCountEvent(
                          product: productDataModel));
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.remove,
                          color: productDataModel.numberOfItems > 1
                              ? Colors.black
                              : Colors.grey[400],
                          size: 21,
                        )),
                  ),
                  const SizedBox(width: 10),
                  Text("${productDataModel.numberOfItems}",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      cartBloc.add(IncrementProductCountEvent(
                          product: productDataModel));
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.add,
                          color: Color.fromRGBO(14, 161, 125, 1),
                          size: 21,
                        )),
                  ),
                  const SizedBox(width: 70),
                  Expanded(
                    flex: 0,
                    child: Text("\$${price.toStringAsFixed(2)}",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
