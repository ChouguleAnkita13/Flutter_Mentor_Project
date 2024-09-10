import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/transferto_contact_controller.dart';

///WIDGET TO SHOW RECENTLY TRANSFER CONTACTLIST
class RecentTransfer extends StatelessWidget {
  const RecentTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///GET LIST OF CONTACTS FOR RECENT TRANSFER FROM TRANSFERTOCONTACT GETX CONTROLLER
    final List contactList =
        Get.find<TransferToContactController>().contactList;
    return Padding(
      padding: EdgeInsets.only(
          left: deviceWidth * 0.044,
          top: deviceHeight * 0.02,
          bottom: deviceHeight * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///TEXT
          Text(
            "Recent Transfers",
            style: GoogleFonts.sora(
              fontSize: deviceWidth < 500
                  ? deviceWidth * 0.035
                  : deviceWidth * 0.025, //14,10
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(25, 25, 25, 1),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.018,
          ),

          ///TRANSFERTOCONTROLLER
          SizedBox(
            height: deviceHeight * 0.11,

            ///LIST OF RECENTLY TRANSFER CONTACTS
            child: ListView.separated(
                itemCount: contactList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///CONTACTS IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            contactList[index].contactImg,
                            height: deviceWidth < 500
                                ? deviceWidth * 0.18
                                : deviceWidth * 0.1, //64
                            width: deviceWidth < 500
                                ? deviceWidth * 0.18
                                : deviceWidth * 0.1,
                            fit: BoxFit.cover,
                          ),
                        ),

                        ///CONTACTS NAME
                        Text(
                          contactList[index].contactName,
                          style: GoogleFonts.sora(
                            fontSize: deviceWidth < 500
                                ? deviceWidth * 0.032
                                : deviceWidth * 0.021, //14,10
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(25, 25, 25, 1),
                          ),
                        )
                      ],
                    ),

                ///LISTVIEW SEPERATOR
                separatorBuilder: (context, idx) => SizedBox(
                      width: deviceWidth * 0.05,
                    )),
          ),
        ],
      ),
    );
  }
}
