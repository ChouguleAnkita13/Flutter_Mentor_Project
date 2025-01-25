import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_state.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';
import 'package:grocery_bloc_app/view/DetailsScreen/nutrition_card.dart';
import 'package:grocery_bloc_app/view/Widgets/button_container.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_snackbar.dart';
import 'package:grocery_bloc_app/controller/FirebaseData/firebase_wishlist_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductDataModel productDataModel;

  const ProductDetailsScreen({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();

    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeProductItemWishlistedActionState) {
            CustomSnackbar.customSnackbar(context, state.message);
          } else if (state is HomeProductRemovedFromWishlistActionState) {
            CustomSnackbar.customSnackbar(context, state.message);
          } else if (state is HomeNavigateToProductDetailsActionState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(productDataModel: state.product)));
          } else if (state is HomeProductItemCartedActionState) {
            CustomSnackbar.customSnackbar(context, state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Product Image
                  Container(
                    height: 400,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(14, 161, 125, 1),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              productDataModel.imageUrl,
                            ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back,
                              color: Color.fromRGBO(14, 161, 125, 1), size: 28),
                        ),
                        GestureDetector(
                          onTap: () {
                            homeBloc.add(HomeProductWishlistButtonClickedEvent(
                                clickedProduct: productDataModel));
                          },
                          child: Icon(
                              FirebaseWishlistData.fevIdList
                                      .contains(productDataModel.id)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: const Color.fromRGBO(14, 161, 125, 1),
                              size: 28),
                        ),
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
                          productDataModel.category,
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productDataModel.name,
                                    style: GoogleFonts.poppins(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${productDataModel.quantity},Price",
                                    style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                            // Product Price

                            Text(
                              '\$${productDataModel.price.toStringAsFixed(2)}',
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
                          productDataModel.description,
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

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        homeBloc.add(HomeAddToCartButtonClickedEvent(
                            clickedProduct: productDataModel));
                      },
                      child: const ButtonContainer(
                        title: "Add To Cart",
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
