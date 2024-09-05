import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/transaction_controller.dart';
import 'package:wallet_app/model/transaction_details_model.dart';
import 'package:wallet_app/model/transaction_model.dart';
import 'package:wallet_app/view/HistoryScreen/Widgets/detail_transaction.dart';

///WIDGET TO DISPLAY HISTORY OF TRANSACTIONS
class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///TRANSACTIONCONTROLLER
    final TransactionController transController =
        Get.find<TransactionController>();

    ///GET ENTIRE TRANSACTION'S LIST
    final List<TransactionModel> transList = transController.transactionList;

    return ListView.separated(
        itemCount: transList.length,
        itemBuilder: (context, index1) {
          ///GET TRANSACTIONDETAILS LIST
          final List<TransactionDetailsModel> transDetailList =
              transList[index1].transactionDetails;
          return Padding(
            padding: EdgeInsets.only(
                left: deviceWidth * 0.044,
                right: deviceWidth * 0.044,
                top: deviceHeight * 0.02),

            ///DAYDATE OF TRANSACTION
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transList[index1].dayDate,
                  style: GoogleFonts.sora(
                    fontSize: deviceWidth < 500
                        ? deviceWidth * 0.04
                        : deviceWidth * 0.035, //14,10
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(83, 93, 102, 1),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),

                ///DETAILED TRANSACTION LIST
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: transDetailList.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            ///SET SELECTED TRANSACTION
                            transController.selectTransaction(transDetailList[index]);
                            ///BOTTOMSHEET TO DETAILS OF TRANSACTION
                            Get.bottomSheet(
                              const DetailTransaction(),
                              barrierColor:
                                  const Color.fromRGBO(25, 25, 25, 0.7),
                            );
                          },
                          child: Row(
                            children: [
                              ///TRANSACTION IMAGE
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    deviceWidth * 0.02), //8
                                child: Image.asset(
                                  transDetailList[index].imgUrl,
                                  height: deviceWidth < 500
                                      ? deviceWidth * 0.09 //32
                                      : deviceWidth * 0.06,
                                  width: deviceWidth < 500
                                      ? deviceWidth * 0.09
                                      : deviceWidth * 0.06,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: deviceWidth * 0.02),

                              ///TRANSACTION TITLE
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    transDetailList[index].transactionTitle,
                                    style: GoogleFonts.sora(
                                      fontSize: deviceWidth < 500
                                          ? deviceWidth * 0.032
                                          : deviceWidth * 0.021, //14,10
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromRGBO(25, 25, 25, 1),
                                    ),
                                  ),

                                  ///TRANSACTION DATE AND TIME
                                  Text(
                                    "${transDetailList[index].date} ${transDetailList[index].time}",
                                    style: GoogleFonts.sora(
                                      fontSize: deviceWidth < 500
                                          ? deviceWidth * 0.03
                                          : deviceWidth * 0.02, //14,10
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          120, 131, 141, 1),
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),

                              ///TRANSACTION AMOUNT
                              Text(
                                transDetailList[index].amount > 0
                                    ? "+\$${transDetailList[index].amount.toStringAsFixed(2)}  "
                                    : "\$${transDetailList[index].amount.toStringAsFixed(2)}  ",
                                style: GoogleFonts.sora(
                                  fontSize: deviceWidth < 500
                                      ? deviceWidth * 0.032
                                      : deviceWidth * 0.021, //14,10
                                  fontWeight: FontWeight.w600,
                                  color: transDetailList[index].amount > 0
                                      ? const Color.fromRGBO(40, 155, 79, 1)
                                      : const Color.fromRGBO(185, 39, 39, 1),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: const Color.fromRGBO(83, 93, 102, 1),
                                size: deviceWidth * 0.025,
                              )
                            ],
                          ),
                        ),

                    ///LISTVIEW SEPERATOR FOR DETAILED TRANSACTION LIST
                    separatorBuilder: (context, idx) => Container(
                        margin: EdgeInsets.only(
                            top: deviceHeight * 0.02,
                            bottom: deviceHeight * 0.02),
                        height: deviceHeight * 0.0015,
                        color: const Color.fromRGBO(237, 239, 246, 1))),
              ],
            ),
          );
        },

        ///LISTVIEW SEPERATOR FOR ENTIRE TRANSACTION LIST
        separatorBuilder: (context, idx1) => Container(
            margin: EdgeInsets.only(
              top: deviceHeight * 0.02,
            ),
            height: deviceHeight * 0.008,
            color: const Color.fromRGBO(237, 239, 246, 1)));
  }
}
