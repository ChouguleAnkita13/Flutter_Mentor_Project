import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/bill_controller.dart';
import 'package:wallet_app/model/saved_bill_model.dart';
import 'package:wallet_app/view/PaybillsScreen/Widgets/payment_status.dart';
import 'package:wallet_app/view/Widgets/common_container.dart';
import 'package:wallet_app/view/Widgets/custom_details_container.dart';
import 'package:wallet_app/view/Widgets/trans_no_container.dart';

///WIDGET TO SHOW DETAILS OF PAYMENT
class PayDetails extends StatelessWidget {
  const PayDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///GET SELECTED BILL FROM BILLCONTROLLER
    final SavedBillModel? selectedBill =
        Get.find<BillController>().selectedBill;

    ///IF BILL IS NOT SELECTED
    if (selectedBill == null) {
      return Center(
        child: GestureDetector(
            onTap: () => Get.toNamed("/paybills"),
            child: const Text("No bill selected!!!!Select bill")),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///PAYMENT STATUS
        const PaymentStatus(),

        ///PAYMENT DETAILS
        SizedBox(
          height: deviceHeight / 2.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///TEXT
              Text(
                "Payment details",
                style: GoogleFonts.sora(
                  fontSize: deviceWidth * 0.035, //14
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),

              ///BILLER TEXT AND BILL TITLE CONTAINER

              CustomDetailsContainer(
                  title: "Biller",
                  content: "${selectedBill.billTitle} company inc."),

              ///BILL AMOUNT
              CustomDetailsContainer(
                  title: "Amount", content: "\$${selectedBill.totalBill}"),

              ///TRANSACTION NO. CONTAINER
              TransactionNoContainer(
                  title: "Transaction no.",
                  transNo: "${selectedBill.transactionNo}"),

              ///REPORT A PROBLEM
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: deviceWidth / 2.5,
                    child: Row(
                      children: [
                        ///FLAG ICON
                        Icon(
                          Icons.flag_outlined,
                          color: const Color.fromRGBO(184, 50, 50, 1),
                          size: deviceHeight * 0.021,
                        ),

                        ///TEXT
                        Text(
                          "Report a problem",
                          style: GoogleFonts.sora(
                            fontSize: deviceWidth * 0.035, //14
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(184, 50, 50, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        ///BACK TO WALLET
        GestureDetector(
            onTap: () => Get.toNamed("/paybills"),
            child: const CommonContainer(title: "Back to wallet")),
      ],
    );
  }
}
