import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/create_account.dart';
import 'package:wallet_app/view/Widgets/common_backrow.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        ///HERE SINGLECHILDSCROLLVIEW IS USED TO AVOID THE OVERFLOW ERROR, WHEN WE GOING TO
        ///TYPE IN TEXTFIELD
        child: SizedBox(
          height: deviceHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.044, vertical: deviceHeight * 0.06),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///COMMONBACKROW() CALLED TO SHOW BACK BUTTON AND TAP'NPAY IMAGE
                CommonBackrow(),

                Spacer(),

                ///CREATEACCOUNT() WIDGET,TO DISPLAY CHECKBOX,CREATEACCOUNT BUTTON AND TEXTFIELDS FOR NAME,EMAIL,PASSWORD
                CreateAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
