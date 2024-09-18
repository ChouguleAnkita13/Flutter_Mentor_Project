import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/view/LoginScreen/widget/mobile_textfield.dart';
import 'package:plant_app/view/custom_container.dart';
import 'package:plant_app/view/VerificationScreen/verification_screen.dart';

///WIDGET TO DISPLAY LOGIN SCREEN 
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.sizeOf(context).height;
    final deviceWidth = MediaQuery.sizeOf(context).width;

    ///GLOBALKEY(FORMKEY) FOR VALIDATION
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: deviceHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.translate(
                offset: const Offset(0.0, -30.0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/images/Group1.png")),
              ),

              ///TEXT
              Text(
                "Log in",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600)),
              ),

              /// FORM FOR VALIDATION
              Form(
                key: formKey,

                ///MOBILE NUMBER TEXTFIELD
                child: const MobileTextfield(),
              ),

              ///LOG IN BUTTON
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const VerificationScreen(),
                      ),
                    );
                  }
                },

                ///CALLED CUSTOMCONTAINER FOR COMMON CODE
                child: const CustomContainer(title: "Log in"),
              ),
              Image.asset(
                "assets/images/login.png",
                height: deviceHeight / 2,
                width: deviceWidth,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
