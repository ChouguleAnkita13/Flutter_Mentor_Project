import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';

class ExploreProductTile extends StatelessWidget {
  final ProductModel productDataModel;
  const ExploreProductTile({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 170,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.itemList[3].imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Text(productDataModel.category,
              style: GoogleFonts.poppins(
                  fontSize: 21, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
