import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/TransferScreen/Widgets/all_contacts.dart';
import 'package:wallet_app/view/TransferScreen/Widgets/search_contact_textfield.dart';
import 'package:wallet_app/view/TransferScreen/Widgets/transfer_to.dart';
import 'package:wallet_app/view/Widgets/custom_back_button.dart';

///WIDGET TO DISPLAY CONTACTS TO TRANSFER AMOUNT
class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
          padding: EdgeInsets.only(
            left: deviceWidth * 0.044,
            right: deviceWidth * 0.044,
            top: deviceHeight * 0.06,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ///CUSTOM BACK BUTTON
            const CustomBackButton(),

            ///
            SizedBox(height: deviceHeight * 0.04), //36
            ///TRANSFER TO CONTACT
            const TransferTo(),
            SizedBox(height: deviceHeight * 0.02), //18

            ///SEARCH TEXTFIELD
            const SearchContactTextfield(),

            ///
            SizedBox(height: deviceHeight * 0.025), //22
            ///SHOW SAVED BILLERS
            const Expanded(child: AllContacts())
          ])),
    );
  }
}
