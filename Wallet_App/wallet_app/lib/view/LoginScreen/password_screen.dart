import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/LoginScreen/Widgets/password_widget.dart';
import 'package:wallet_app/view/Widgets/common_backrow.dart';

///WIDGET TO PASSWORDSCREEN AFTER CONTINUING FROM LOGINSCREEN
class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: deviceHeight < 750 && deviceWidth > 600
                      ? deviceHeight * 0.5
                      : deviceHeight * 0.58,
                  width: double.infinity,
                  color: const Color.fromRGBO(247, 244, 255, 1),
                  padding: EdgeInsets.only(
                      left: deviceWidth * 0.044, top: deviceHeight * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///COMMONBACKROW() CALLED TO SHOW BACK BUTTON AND TAP'NPAY IMAGE
                      const CommonBackrow(),
                      SizedBox(height: deviceHeight * 0.08),

                      ///PASSWORD IMAGE
                      Center(
                        child: Image.asset(
                          "assets/images/login/password.png",
                          height: deviceHeight < 750 && deviceWidth > 600
                              ? deviceHeight * 0.25
                              : deviceHeight * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                ///TO DISPLAY PASSWORD CONTAINER,PASSWORDWIDGET() CALLED
                const Expanded(child: PasswordWidget())
              ],
            ),
          ),
        ));
  }
}
