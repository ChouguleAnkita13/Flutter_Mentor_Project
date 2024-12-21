import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/view/HomeScreen/home_screen.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/bottom_line_button.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/custom_textfield.dart';
import 'package:grocery_bloc_app/view/LoginRegister/register_screen.dart';
import 'package:grocery_bloc_app/view/Widgets/button_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                // Image.asset(
                //   "assets/images/logo.png",
                // ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 258,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login to your Account",
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
                            title: "Email",
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextfield(
                            title: "Password",
                            controller: _passwordController,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                            child: const ButtonContainer(title: "Sign In"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // const Spacer(),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                  child: const BottomLineButton(
                      content: "Don’t have an account? ", title: "Sign up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
