import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/transferto_contact_controller.dart';
import 'package:wallet_app/model/transferto_contact_model.dart';
import 'package:wallet_app/view/TransferScreen/Widgets/amount_textfield.dart';
import 'package:wallet_app/view/TransferScreen/Widgets/contact_info.dart';
import 'package:wallet_app/view/Widgets/custom_back_button.dart';
import 'package:wallet_app/view/Widgets/secure_pay_container.dart';

///WIDGET TO DISPLAY TRANSFER AMOUNT TO CONTACT
class AmountScreen extends StatelessWidget {
  const AmountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    /// GLOBAL KEY FOR FORM VALIDATION
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    ///GET SELECTEDCONTACT FROM TRANSFERTOCONTACTCONTROLLER
    final TransferToContactModel? contact =
        Get.find<TransferToContactController>().selectedContact;

    ///IF CONTACT IS NOT SELECTED
    if (contact == null) {
      return Scaffold(
        body: Center(
          child: GestureDetector(
              onTap: () => Get.toNamed("/transfer"),
              child: const Text("Contact Not selected!!!!Select contact")),
        ),
      );
    }
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
          child: SizedBox(
            height: deviceHeight,
            child: Padding(
                padding: EdgeInsets.only(
                    left: deviceWidth * 0.044,
                    right: deviceWidth * 0.044,
                    top: deviceHeight * 0.06,
                    bottom: deviceHeight * 0.04),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///CUSTOM BACK BUTTON
                      const CustomBackButton(),
                      SizedBox(height: deviceHeight * 0.04), //36
                      Container(
                        height: deviceHeight / 3,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Transfer To",
                              style: GoogleFonts.sora(
                                fontSize: deviceWidth < 500
                                    ? deviceWidth * 0.06
                                    : deviceWidth * 0.05, //24,20
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(25, 25, 25, 1),
                              ),
                            ),

                            ///CONTACT INFO ROW
                            const ContactInfo(),

                            ///TEXTFIELD TO ENTER AMOUNT
                            Form(key: formKey, child: const AmountTextfield())
                          ],
                        ),
                      ),
                      const Spacer(),

                      ///SECURE PAYMENT
                      GestureDetector(
                          onTap: () {
                            /// VALIDATE THE FORM WHEN THE BUTTON IS PRESSED
                            if (formKey.currentState!.validate()) {
                              Get.toNamed("/payfailed");
                            }
                          },
                          child: const SecurePayContainer()),
                    ])),
          ),
        ));
  }
}
