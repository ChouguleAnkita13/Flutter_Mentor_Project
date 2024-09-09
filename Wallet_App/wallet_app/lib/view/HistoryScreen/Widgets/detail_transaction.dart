import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/transaction_controller.dart';
import 'package:wallet_app/model/transaction_details_model.dart';
import 'package:wallet_app/view/Widgets/custom_details_container.dart';
import 'package:wallet_app/view/Widgets/custom_details_row.dart';
import 'package:wallet_app/view/Widgets/trans_no_container.dart';

///WIDGET TO SHOW DETAILS OF TRANSACTION WILL CALLED ON BOTTOMSHEET
class DetailTransaction extends StatelessWidget {
  const DetailTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///GET SELECTED TRANSACTION FROM TRANSACTIONCONTROLLER
    final TransactionDetailsModel? selectedTransaction =
        Get.find<TransactionController>().selectedTransaction;
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
          ///TRANSACTION IMAGE,TITLE,SUBTITLE

          CustomDetailsRow(
              imgUrl: selectedTransaction!.imgUrl,
              title: selectedTransaction.transactionTitle,
              subtitle: "Retailer corporation"),

          SizedBox(height: deviceWidth * 0.01),

          ///TRANSACTION AMOUNT CONTAINER
          Container(
            ///DECORATION CONTAINER
            padding: EdgeInsets.symmetric(
              horizontal: deviceWidth * 0.02, //8
              vertical: deviceWidth * 0.041, //16
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: selectedTransaction.amount > 0
                    ? const Color.fromRGBO(230, 246, 236, 1)
                    : const Color.fromRGBO(255, 246, 246, 1),
                borderRadius: BorderRadius.circular(deviceWidth * 0.02)),

            ///TRANSACTION AMOUNT
            child: Text(
              selectedTransaction.amount > 0
                  ? "+\$${selectedTransaction.amount.toStringAsFixed(2)}  "
                  : "\$${selectedTransaction.amount.toStringAsFixed(2)}  ",
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.055
                    : deviceWidth * 0.044, //21,18
                fontWeight: FontWeight.w600,
                color: selectedTransaction.amount > 0
                    ? const Color.fromRGBO(40, 155, 79, 1)
                    : const Color.fromRGBO(185, 39, 39, 1),
              ),
            ),
          ),

          ///TRANSACTION DATE AND TIME CONTAINER
          CustomDetailsContainer(
              title: selectedTransaction.date,
              content:
                  "${selectedTransaction.date} - ${selectedTransaction.time}"),

          ///TRANSACTION NO CONTAINER
          TransactionNoContainer(
              title: "Transaction no.",
              transNo: "${selectedTransaction.transactionNo}"),

          ///REPORT A PROBLEM
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
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
        ],
      ),
    );
  }
}
