import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/bill_controller.dart';
import 'package:wallet_app/model/saved_bill_model.dart';
import 'package:wallet_app/view/PaybillsScreen/Widgets/detail_bill.dart';

///WIDGET TO DISPLAY ALL SAVED BILLERS
class SavedBillers extends StatelessWidget {
  const SavedBillers({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///GETX BILLCONTROLLER
    final billController = Get.find<BillController>();

    ///GET SAVEDBILLERLIST OF SVAEDBILLMODEL USING GETX BILLCONTROLLER

    final List<SavedBillModel> savedBillersList = billController.savedBillList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///TEXT
        Text(
          "Saved billers",
          style: GoogleFonts.sora(
            fontSize: deviceWidth < 500
                ? deviceWidth * 0.035
                : deviceWidth * 0.03, //14,12
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(83, 93, 102, 1),
          ),
        ),
        SizedBox(height: deviceHeight * 0.01),

        ///MORE ITEM LIST
        ListView.separated(
            shrinkWrap: true,
            itemCount: savedBillersList.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    ///SET SELECTED BILL
                    billController.selectBill(savedBillersList[index]);

                    ///BOTTOMSHEET TO SHOW DETAILS OF BILL
                    Get.bottomSheet(
                      const DetailBill(),
                      barrierColor: const Color.fromRGBO(25, 25, 25, 0.7),
                    );
                  },
                  child: ListTile(
                    ///ITEM IMAGE
                    leading: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(deviceWidth * 0.02), //8
                      child: Image.asset(
                        savedBillersList[index].billImgUrl,
                        height: deviceWidth < 500
                            ? deviceWidth * 0.09 //32
                            : deviceWidth * 0.06,
                        width: deviceWidth < 500
                            ? deviceWidth * 0.09
                            : deviceWidth * 0.06,
                        fit: BoxFit.cover,
                      ),
                    ),

                    ///MORE TITLE
                    title: Text(
                      savedBillersList[index].billTitle,
                      style: GoogleFonts.sora(
                        fontSize: deviceWidth < 500
                            ? deviceWidth * 0.032
                            : deviceWidth * 0.021, //14,10
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(25, 25, 25, 1),
                      ),
                    ),

                    subtitle: Text(
                      savedBillersList[index].payStatus
                          ? "All paid"
                          : "Due: \$${savedBillersList[index].totalBill}",
                      style: GoogleFonts.sora(
                        fontSize: deviceWidth < 500
                            ? deviceWidth * 0.03
                            : deviceWidth * 0.02, //12,8
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(83, 93, 102, 1),
                      ),
                    ),

                    ///ICON
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: const Color.fromRGBO(83, 93, 102, 1),
                      size: deviceWidth * 0.025,
                    ),
                  ),
                ),

            ///LISTVIEW SEPERATOR FOR MORE ITEM LIST
            separatorBuilder: (context, idx) => Container(
                margin: EdgeInsets.only(
                    top: deviceHeight * 0.01, bottom: deviceHeight * 0.01),
                height: deviceHeight * 0.0015,
                color: const Color.fromRGBO(237, 239, 246, 1)))
      ],
    );
  }
}
