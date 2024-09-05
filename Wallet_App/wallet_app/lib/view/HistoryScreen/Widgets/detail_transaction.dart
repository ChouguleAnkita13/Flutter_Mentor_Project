import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/transaction_controller.dart';
import 'package:wallet_app/model/transaction_details_model.dart';
                           
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
          ///TRANSACTION IMAGE,TITLE
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(deviceWidth * 0.02), //8
                ///TRANSACTION IMAGE
                child: Image.asset(
                  selectedTransaction!.imgUrl,
                  height: deviceWidth < 500
                      ? deviceWidth * 0.14 //56
                      : deviceWidth * 0.1,
                  width: deviceWidth < 500
                      ? deviceWidth * 0.14
                      : deviceWidth * 0.1,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: deviceWidth * 0.02),

              ///TRANSACTION TITLE AND TEXT
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///TRANSACTION TITLE
                  Text(
                    selectedTransaction.transactionTitle,
                    style: GoogleFonts.sora(
                      fontSize: deviceWidth * 0.05, //16
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(25, 25, 25, 1),
                    ),
                  ),

                  ///TEXT
                  Text(
                    "Retailer corporation",
                    style: GoogleFonts.sora(
                      fontSize: deviceWidth < 500
                          ? deviceWidth * 0.037
                          : deviceWidth * 0.03, //14,12
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(120, 131, 141, 1),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              ///DONE BUTTON
              GestureDetector(
                onTap: () => Get.back(),
                child: Text(
                  "Done",
                  style: GoogleFonts.sora(
                    fontSize: deviceWidth * 0.035, //14
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(29, 98, 202, 1),
                  ),
                ),
              )
            ],
          ),

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
          Container(
            ///DECORATION CONTAINER
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: deviceWidth * 0.03, //12
              vertical: deviceWidth * 0.041, //16
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(237, 239, 246, 1),
                ),
                borderRadius: BorderRadius.circular(deviceWidth * 0.02)),

            ///TRANSACTION DAY, DATE TIME
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ///Day
              Text(
                selectedTransaction.date,
                style: GoogleFonts.sora(
                  fontSize: deviceWidth < 500
                      ? deviceWidth * 0.035
                      : deviceWidth * 0.025, //14,9
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(120, 131, 141, 1),
                ),
              ),

              ///DATE AND TIME
              Text(
                "${selectedTransaction.date} - ${selectedTransaction.time}",
                style: GoogleFonts.sora(
                  fontSize: deviceWidth < 500
                      ? deviceWidth * 0.035
                      : deviceWidth * 0.02, //14,9
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(83, 93, 102, 1),
                ),
              ),
            ]),
          ),

          ///TRANSACTION NO CONTAINER
          Container(
            ///DECORATION CONTAINER
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: deviceWidth * 0.03, //12
              vertical: deviceWidth * 0.041, //16
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(237, 239, 246, 1),
                ),
                borderRadius: BorderRadius.circular(deviceWidth * 0.02)),

            ///TEXT AND TRANSCATION NO
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ///TEXT
                  Text(
                    "Transaction no.",
                    style: GoogleFonts.sora(
                      fontSize: deviceWidth < 500
                          ? deviceWidth * 0.035
                          : deviceWidth * 0.025, //14,9
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(120, 131, 141, 1),
                    ),
                  ),

                  ///TRANSCATION NO
                  Text(
                    "${selectedTransaction.transactionNo}",
                    style: GoogleFonts.sora(
                      fontSize: deviceWidth < 500
                          ? deviceWidth * 0.035
                          : deviceWidth * 0.02, //14,9
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(83, 93, 102, 1),
                    ),
                  ),
                ]),
                const Spacer(),

                ///COPY ICON
                Icon(
                  Icons.copy_rounded,
                  color: const Color.fromRGBO(83, 93, 102, 1),
                  size: deviceHeight * 0.03,
                ),
              ],
            ),
          ),

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
