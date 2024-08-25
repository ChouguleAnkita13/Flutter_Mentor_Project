import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/view/LoginScreen/widget/mobile_textfield.dart';
import 'package:plant_app/view/custom_container.dart';
import 'package:plant_app/view/VerificationScreen/verification_screen.dart';
// import 'package:plantapp/verification.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //GlobalKey(formKey) for validation
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.translate(
                offset: const Offset(0.0, -30.0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/images/Group1.png")),
              ),

              Text(
                "Log in",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600)),
              ),
              // Form for validation
              Form(
                key: formKey,
                      //Mobile Number TextField
                child: const MobileTextfield(),
              ),
              //Log in Button
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
                  //Called CustomContainer for common code
                  child: const CustomContainer(title: "Log in")),
              Image.asset(
                "assets/images/login.png",
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width,
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
