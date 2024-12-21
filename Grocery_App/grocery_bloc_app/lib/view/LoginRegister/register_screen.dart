import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/bottom_line_button.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/custom_textfield.dart';
import 'package:grocery_bloc_app/view/LoginRegister/login_screen.dart';
import 'package:grocery_bloc_app/view/Widgets/button_container.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   "assets/images/logo.png",
                // ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create your Account",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            CustomTextfield(
                                title: "Username",
                                controller: _usernameController),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextfield(
                                title: "Email", controller: _emailController),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextfield(
                                title: "Password",
                                controller: _passwordController),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const ButtonContainer(title: "Sign Up"),
                            ),
                          ],
                        ),
                      ],
                    )),
                // const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const BottomLineButton(
                      content: "Already have an account? ", title: "Sign In"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
