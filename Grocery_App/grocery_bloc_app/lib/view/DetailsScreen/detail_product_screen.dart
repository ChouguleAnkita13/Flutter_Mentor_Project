import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';
import 'package:grocery_bloc_app/view/DetailsScreen/nutrition_card.dart';
import 'package:grocery_bloc_app/view/Widgets/button_container.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductDataModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: CustomAppbar.customAppbar(product.category),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Product Image
            Container(
              height: 400,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(14, 161, 125, 1),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        product.imageUrl,
                      ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Color.fromRGBO(14, 161, 125, 1), size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Icon(Icons.favorite_border,
                      color: Color.fromRGBO(14, 161, 125, 1), size: 28),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.category,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(14, 161, 125, 1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Product Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${product.quantity},Price",
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      // Product Price

                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  // Product Description
                  Text(
                    'Description',
                    style: GoogleFonts.poppins(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NutritionCard(label: 'Cal', value: "46"),
                      NutritionCard(label: "Fat", value: "0.5 g"),
                      NutritionCard(label: "Carb", value: "10 g"),
                      NutritionCard(label: "Prot", value: "1.5 g"),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(15.0),
              child: ButtonContainer(
                title: "Add To Cart",
              ),
            )
          ],
        ),
      ),
    );
  }
}
