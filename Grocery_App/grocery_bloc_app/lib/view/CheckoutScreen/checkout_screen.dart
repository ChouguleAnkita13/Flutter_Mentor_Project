import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/CheckoutBloc/checkout_bloc.dart';
import 'package:grocery_bloc_app/controller/CheckoutBloc/checkout_event.dart';
import 'package:grocery_bloc_app/controller/CheckoutBloc/checkout_state.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';
import 'package:grocery_bloc_app/view/CheckoutScreen/Widget/address_section.dart';
import 'package:grocery_bloc_app/view/CheckoutScreen/Widget/delivery_time.dart';
import 'package:grocery_bloc_app/view/CheckoutScreen/Widget/item_tile.dart';
import 'package:grocery_bloc_app/view/CheckoutScreen/Widget/payment_section.dart';
import 'package:grocery_bloc_app/view/CheckoutScreen/Widget/place_order_dialog.dart';
import 'package:grocery_bloc_app/view/CheckoutScreen/Widget/total_amount.dart';
import 'package:grocery_bloc_app/view/Widgets/button_container.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_snackbar.dart';
import 'package:grocery_bloc_app/view/navbar_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.checkoutItems,
    required this.totalAmount,
  });
  final List<ProductDataModel> checkoutItems;
  final double totalAmount;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final checkoutBloc = CheckoutBloc();

  @override
  void initState() {
    checkoutBloc.add(CheckoutInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: checkoutBloc,
        listenWhen: (previous, current) => current is CheckoutActionState,
        buildWhen: (previous, current) => current is! CheckoutActionState,
        listener: (context, state) {
          if (state is CheckoutButtonPlaceOrderDialogState) {
            PlaceOrderDialog.showPlaceOrderDialog(context, checkoutBloc);
          }
          if (state is CheckoutButtonEnterAddressSnackbarState) {
            CustomSnackbar.customSnackbar(context, state.message);
          } else if (state is CheckoutDoneButtonState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavbarScreen(selectedIndex: 1)),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is CheckoutPaymentMethodState) {
            return Scaffold(
              appBar: CustomAppbar.customAppbar("Your Order"),
              backgroundColor: Colors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Delivery Address Section
                  AddressSection(
                      deliveryAddressTextEditingController:
                          checkoutBloc.deliveryAddressTextEditingController),
                  const SizedBox(height: 10),

                  // Items List Section
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: widget.checkoutItems.length,
                      itemBuilder: (context, index) {
                        final item = widget.checkoutItems[index];
                        return ItemTile(item: item);
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Payment Method Section

                  PaymentSection(
                      paymentMethod: state.paymentMethod,
                      checkoutBloc: checkoutBloc),
                  const SizedBox(height: 10),

                  // Estimated Delivery Time Section
                  DeliveryTime(time: checkoutBloc.deliveryTime),
                  const SizedBox(height: 10),
                  // Total Amount Section
                  TotalAmount(totalAmount: widget.totalAmount),
                  const SizedBox(height: 20),

                  ///Checkout
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: GestureDetector(
                        onTap: () {
                          checkoutBloc.add(CheckoutButtonEvent(
                              checkoutItems: widget.checkoutItems,
                              deliveryAddress: checkoutBloc
                                  .deliveryAddressTextEditingController.text,
                              totalAmount: widget.totalAmount,
                              paymentMethod: state.paymentMethod,
                              deliveryTime: checkoutBloc.deliveryTime));
                        },
                        child: const ButtonContainer(title: "Checkout")),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
