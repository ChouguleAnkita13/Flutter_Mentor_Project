import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/transferto_contact_controller.dart';
import 'package:wallet_app/model/transferto_contact_model.dart';

///WIDGET TO DISPLAY ALL CONTACTS
class AllContacts extends StatelessWidget {
  const AllContacts({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///GETX TRANSFERTOCONTACTCONTROLLER
    final TransferToContactController transferToContactController =
        Get.find<TransferToContactController>();

    ///GET CONTACTLIST OF TRANSFERTOCONTACTMODEL USING GETX TRANSFERTOCONTACTCONTROLLER

    final List<TransferToContactModel> contactList =
        transferToContactController.contactList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///TEXT
        Text(
          "All Contacts",
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
        Expanded(
          child: ListView.separated(
              itemCount: contactList.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      ///SET SELECTED BILL
                      transferToContactController.selectContact(contactList[index]);
          
                      ///NAVIGATE TO AMOUNT SCREEN
                      Get.toNamed("amountScreen");
                    },
                    child: ListTile(
                      ///CONTACT IMAGE
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          contactList[index].contactImg,
                          height: deviceWidth < 500
                              ? deviceWidth * 0.1 //41
                              : deviceWidth * 0.07, //28
                          width: deviceWidth < 500
                              ? deviceWidth * 0.1
                              : deviceWidth * 0.07,
                          fit: BoxFit.cover,
                        ),
                      ),
          
                      ///CONTACT NAME
                      title: Text(
                        contactList[index].contactName,
                        style: GoogleFonts.sora(
                          fontSize: deviceWidth < 500
                              ? deviceWidth * 0.032
                              : deviceWidth * 0.021, //14,10
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
          
                      ///PHONE NUMBER
                      subtitle: Text(
                        contactList[index].phone,
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
          
              ///LISTVIEW SEPERATOR FOR CONTACT LIST
              separatorBuilder: (context, idx) => Container(
                  margin: EdgeInsets.only(
                      top: deviceHeight * 0.01, bottom: deviceHeight * 0.01),
                  height: deviceHeight * 0.0015,
                  color: const Color.fromRGBO(237, 239, 246, 1))),
        )
      ],
    );
  }
}
