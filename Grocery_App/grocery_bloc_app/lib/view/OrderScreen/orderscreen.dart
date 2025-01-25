import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/OrderBloc/order_bloc.dart';
import 'package:grocery_bloc_app/controller/OrderBloc/order_event.dart';
import 'package:grocery_bloc_app/controller/OrderBloc/order_state.dart';
import 'package:grocery_bloc_app/view/OrderScreen/order_tile.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc()..add(OrderInitialEvent()),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrdersLoadingState) {
            return const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(color: Color(0xFF0EA17D)),
              ),
            );
          } else if (state is OrdersLoadedSuccessState) {
            return Scaffold(
              appBar: CustomAppbar.customAppbar("My Orders"),
              backgroundColor: Colors.white,
              body: state.ordersList.isEmpty
                  ? const Center(child: Text("No Orders Yet"))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: state.ordersList.length,
                      itemBuilder: (context, index) {
                        final order = state.ordersList[index];
                        return OrderTile(order: order);
                      },
                    ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
