import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/bill_controller.dart';
import 'package:wallet_app/model/saved_bill_model.dart';
import 'package:wallet_app/view/Widgets/custom_details_container.dart';
import 'package:wallet_app/view/Widgets/custom_details_row.dart';

///WIDGET TO SHOW DETAILS OF BILL WILL CALLED ON BOTTOMSHEET
class DetailBill extends StatelessWidget {
  const DetailBill({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///GET SELECTED BILL FROM BILLCONTROLLER
    final SavedBillModel? selectedBill =
        Get.find<BillController>().selectedBill;
    return Container(
      ///DECORATION CONTAINER
      width: double.infinity,
      padding: EdgeInsets.only(
          left: deviceWidth * 0.044, //18
          right: deviceWidth * 0.044,
          bottom: deviceWidth * 0.09 //38
          ),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(deviceWidth * 0.044),
              topRight: Radius.circular(deviceWidth * 0.044))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ///WIDGET TO DISPLAY BILL IMAGE,TITLE,SUBTITLE

          CustomDetailsRow(
              imgUrl: selectedBill!.billImgUrl,
              title: selectedBill.billTitle,
              subtitle: "Utility"),
          SizedBox(height: deviceWidth * 0.01),

          ///BILL AMOUNT CONTAINER
          Container(
            ///DECORATION CONTAINER
            padding: EdgeInsets.symmetric(
              horizontal: deviceWidth * 0.02, //8
              vertical: deviceWidth * 0.041, //16
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: selectedBill.payStatus
                    ? const Color.fromRGBO(230, 246, 236, 1)
                    : const Color.fromRGBO(255, 246, 246, 1),
                borderRadius: BorderRadius.circular(deviceWidth * 0.02)),

            ///BILL AMOUNT
            child: Text(
              selectedBill.payStatus
                  ? "All paid "
                  : "Due:\$${selectedBill.totalBill.toStringAsFixed(2)}  ",
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.055
                    : deviceWidth * 0.044, //21,18
                fontWeight: FontWeight.w600,
                color: selectedBill.payStatus
                    ? const Color.fromRGBO(40, 155, 79, 1)
                    : const Color.fromRGBO(185, 39, 39, 1),
              ),
            ),
          ),

          ///BILL DATE AND TIME CONTAINER
          CustomDetailsContainer(
              title: "Due date",
              content: "${selectedBill.date} - ${selectedBill.time}"),

          ///RESITRATION NO. CONTAINER
          CustomDetailsContainer(
              title: "Registration no.",
              content: "${selectedBill.transactionNo}"),

          ///SECURE PAYMENT
          GestureDetector(
            onTap: () => Get.toNamed("/paysuccess"),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.03, //12
                vertical: deviceWidth * 0.041, //16
              ),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(253, 194, 40, 1),
                  borderRadius: BorderRadius.circular(deviceWidth * 0.02)),
              child: SizedBox(
                width: deviceWidth / 2.5,
                child: Row(
                  children: [
                    /// ICON
                    Icon(
                      Icons.pending_actions,
                      color: const Color.fromRGBO(39, 6, 133, 1),
                      size: deviceHeight * 0.021,
                    ),

                    ///TEXT
                    Text(
                      "  Secure payment",
                      style: GoogleFonts.sora(
                        fontSize: deviceWidth * 0.035, //14
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(39, 6, 133, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
