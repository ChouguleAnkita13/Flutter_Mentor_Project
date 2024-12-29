import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_state.dart';
import 'package:grocery_bloc_app/view/HomeScreen/Widget/custom_row.dart';
import 'package:grocery_bloc_app/view/HomeScreen/Widget/home_appbar.dart';
import 'package:grocery_bloc_app/view/HomeScreen/Widget/home_product_tile_widget.dart';
import 'package:grocery_bloc_app/view/detail_product.dart';
import 'package:grocery_bloc_app/view/navbar_screen.dart';
import 'package:grocery_bloc_app/view/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        if (state is HomeNavigateToNotificationPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationScreen()));
        } else if (state is HomeNavigateToExploreSeeAllActionState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const NavbarScreen(
                        selectedIndex: 1,
                      )));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Wishlisted')));
        } else if (state is HomeNavigateToProductDetailsActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: state.product)));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case const (HomeLoadedSuccessState):
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: HomeAppbar.appBar(homeBloc),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: Column(
                    children: [
                      CustomRow(
                        title: "Exclusive Offers",
                        homeBloc: homeBloc,
                      ),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: successState.products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  homeBloc.add(HomeProductDetailsClickedEvent(
                                      clickedProduct: successState
                                          .products[index].itemList[0]));
                                },
                                child: HomeProductTileWidget(
                                    homeBloc: homeBloc,
                                    productDataModel: successState
                                        .products[index].itemList[0]),
                              );
                            }),
                      ),
                      CustomRow(
                        title: "Best Selling",
                        homeBloc: homeBloc,
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: successState.products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  homeBloc.add(HomeProductDetailsClickedEvent(
                                      clickedProduct: successState
                                          .products[index].itemList[1]));
                                },
                                child: HomeProductTileWidget(
                                    homeBloc: homeBloc,
                                    productDataModel: successState
                                        .products[index].itemList[1]),
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
