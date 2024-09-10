import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/transferto_contact_controller.dart';
import 'package:wallet_app/model/transferto_contact_model.dart';
///WIDGET SHOW CONTACT INFORMATION
class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;

    ///GET SELECTEDCONTACT FROM TRANSFERTOCONTACTCONTROLLER
    final TransferToContactModel? contact =
        Get.find<TransferToContactController>().selectedContact;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///CONTACT IMAGE
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            contact!.contactImg,
            height: deviceWidth < 500
                ? deviceWidth * 0.173 //70
                : deviceWidth * 0.15, //64
            width:
                deviceWidth < 500 ? deviceWidth * 0.173 : deviceWidth * 0.015,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: deviceWidth * 0.025), //10

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ///CONTACT NAME
            Text(
              contact.contactName,
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.04
                    : deviceWidth * 0.035, //16,14
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),

            ///PHONE NUMBER
            Text(
              contact.phone,
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.035
                    : deviceWidth * 0.03, //14,12
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(83, 93, 102, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
