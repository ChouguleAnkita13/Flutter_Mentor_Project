import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_state.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';
import 'package:grocery_bloc_app/view/ProductsScreen/product_tile.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_snackbar.dart';
import 'package:grocery_bloc_app/view/DetailsScreen/detail_product_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.products,
    required this.category,
  });
  final List<ProductDataModel> products;
  final String category;

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
        } else if (state is HomeProductRemoveFromCartActionState) {
          CustomSnackbar.customSnackbar(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppbar.customAppbar(category),
          body: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            homeBloc.add(HomeProductDetailsClickedEvent(
                                clickedProduct: products[index]));
                          },
                          child: ProductTile(
                              homeBloc: homeBloc,
                              productDataModel: products[index]),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
