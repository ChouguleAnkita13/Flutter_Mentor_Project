import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_state.dart';
import 'package:grocery_bloc_app/view/HomeScreen/Widget/custom_row.dart';
import 'package:grocery_bloc_app/view/HomeScreen/Widget/home_appbar.dart';
import 'package:grocery_bloc_app/view/HomeScreen/Widget/product_tile_widget.dart';
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
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Wishlisted')));
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
                      const CustomRow(title: "Exclusive Offers"),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: successState.products.length,
                            itemBuilder: (context, index) {
                              return ProductTileWidget(
                                  homeBloc: homeBloc,
                                  productDataModel:
                                      successState.products[index]);
                            }),
                      ),
                      const CustomRow(title: "Best Selling"),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: successState.products.length,
                            itemBuilder: (context, index) {
                              return ProductTileWidget(
                                  homeBloc: homeBloc,
                                  productDataModel:
                                      successState.products[index]);
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
