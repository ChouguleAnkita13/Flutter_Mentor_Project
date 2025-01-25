import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_state.dart';
import 'package:grocery_bloc_app/view/ExploreScreen/Widget/explore_product_tile.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/custom_textfield.dart';
import 'package:grocery_bloc_app/view/ProductsScreen/product_screen.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToExploreProductsActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductScreen(
                        products: state.products,
                        category: state.category,
                      )));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Center(
              child: CircularProgressIndicator(
                  color: Color.fromRGBO(14, 161, 125, 1)),
            );
          case const (HomeLoadedSuccessState):
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: CustomAppbar.customAppbar("Find Products"),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextfield(
                            title: "Search Products",
                            textcontroller: TextEditingController()),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                            itemCount: successState.products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  homeBloc.add(
                                      HomeExploreProductButtonClickedEvent(
                                          clickedProduct: successState
                                              .products[index].itemList,
                                          category: successState
                                              .products[index].category));
                                },
                                child: ExploreProductTile(
                                    productDataModel:
                                        successState.products[index]),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );

          case const (HomeErrorState):
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
