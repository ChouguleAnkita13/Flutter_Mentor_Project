import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/WishListBloc/wishlist_bloc.dart';
import 'package:grocery_bloc_app/controller/WishListBloc/wishlist_event.dart';
import 'package:grocery_bloc_app/controller/WishListBloc/wishlist_state.dart';
import 'package:grocery_bloc_app/view/Widgets/button_container.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';
import 'package:grocery_bloc_app/view/WishlistScreen/wishlist_tile_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  WishlistBloc wishListBloc = WishlistBloc();
  @override
  void initState() {
    wishListBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: wishListBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (WishlistLoadingState):
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case const (WishlistSuccessState):
              final successState = state as WishlistSuccessState;
              return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: CustomAppbar.customAppbar("Favorites"),
                  body: successState.products.isEmpty
                      ? const Center(
                          child: Text("No Item added in WishList"),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 170,
                                child: ListView.separated(
                                  itemCount: successState.products.length,
                                  itemBuilder: (context, index) {
                                    return WishlistTileWidget(
                                      wishlistBloc: wishListBloc,
                                      productDataModel:
                                          successState.products[index],
                                    );
                                  },
                                  separatorBuilder: (context, idx) => Divider(
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: const ButtonContainer(
                                    title: "Add All To cart"),
                              )
                            ],
                          ),
                        ));
            default:
              return const SizedBox();
          }
        },
        listener: (context, state) {
          if (state is WishlistRemoveItemFromWishlistActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Item Removed from wishlist")));
          }
        });
  }
}
