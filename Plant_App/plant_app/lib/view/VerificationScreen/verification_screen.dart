import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/view/HomeScreen/home_screen.dart';
import 'package:plant_app/view/VerificationScreen/Widgets/custom_toprow.dart';
import 'package:plant_app/view/VerificationScreen/Widgets/otp_textfield.dart';
import 'package:plant_app/view/custom_container.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height / 1.87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //For Row with arrow icon and image called CustomToprow()
            const CustomToprow(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Verification",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                    //Text
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.4,
                      child: Text(
                        "Enter the OTP code from the phone we just sent you.",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    //To display otp textFields called to OTPTextField()
                    const OTPTextfield(),
                    //TextSpan
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "Don’t receive OTP code! ",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                      TextSpan(
                        text: "Resend",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                      )
                    ])),
                  ],
                ),
              ),
            ),
            //Button to navigate to homepage
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
                //Called CustomContainer
                child: const CustomContainer(title: "Submit")),
          ],
        ),
      ),
    );
  }
}
