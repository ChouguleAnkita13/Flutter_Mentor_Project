import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/login_controller.dart';
import 'package:wallet_app/view/Widgets/common_backrow.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
///WIDGET TO DISPLAY OTP AND REQUIRED TEXTS
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.044, vertical: deviceHeight * 0.06),
        child: SizedBox(
          height: deviceHeight / 2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///COMMONBACKROW() CALLED TO SHOW BACK BUTTON AND TAP'NPAY IMAGE
              const Align(alignment: Alignment.topLeft, child: CommonBackrow()),

              ///TEXT
              SizedBox(
                width: deviceWidth / 1.5,
                child: Text(
                  "An SMS sent to your mobile number +962 79 XXX-XXXX",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sora(
                    fontSize: deviceWidth * 0.035, //14
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(25, 25, 25, 1),
                  ),
                ),
              ),

              ///TEXT
              Text(
                "Enter six-digit code",
                textAlign: TextAlign.center,
                style: GoogleFonts.sora(
                  fontSize: deviceWidth * 0.03, //12
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(120, 131, 141, 1),
                ),
              ),

              ///OTPTEXTFIELD()
              GetBuilder<LoginController>(
                builder: (loginController) => OtpTextField(
                  numberOfFields: 6,
                  enabledBorderColor: !loginController.isSubmitOtp
                      ? const Color.fromRGBO(87, 50, 191, 1)
                      : const Color.fromRGBO(77, 166, 107, 1),
                  margin: const EdgeInsets.only(right: 0),
                  textStyle: GoogleFonts.sora(
                    fontSize: deviceWidth * 0.075, //36
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(25, 25, 25, 1),
                  ),

                  ///RUNS WHEN EVERY TEXTFIELD IS FILLED
                  onSubmit: (String verificationCode) {
                    loginController.updateOtpStatus();
                    ///ONCE OTP SUBMITTED NAVIGATE TO LOGIN SCREEN AFTER GIVEN TIME
                    Future.delayed(const Duration(seconds:3),()=>Get.toNamed("/login"));
                  },
                ),
              ),

              GetBuilder<LoginController>(
                builder: (loginController) => Text.rich(TextSpan(children: [
                  ///TEXTSPAN FOR RESET CODE WITH TIME

                  TextSpan(
                    text: "Resend code",
                    style: GoogleFonts.sora(
                      fontSize: deviceWidth * 0.035, //14
                      fontWeight: loginController.isSubmitOtp
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: loginController.isSubmitOtp
                          ? const Color.fromRGBO(29, 98, 202, 1)
                          : const Color.fromRGBO(120, 131, 141, 1),
                    ),
                  ),
                  TextSpan(
                    text: loginController.isSubmitOtp ? "  00:00" : "  00:32",
                    style: GoogleFonts.sora(
                      fontSize: deviceWidth * 0.035, //14
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  )
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
