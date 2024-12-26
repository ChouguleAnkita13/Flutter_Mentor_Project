import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/bottom_line_button.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/custom_textfield.dart';
import 'package:grocery_bloc_app/view/LoginRegister/register_screen.dart';
import 'package:grocery_bloc_app/view/Widgets/button_container.dart';
import 'package:grocery_bloc_app/view/navbar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final loginRegisterBloc = LoginRegisterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///BLOC LISTERNER USED TO ONLY LISTEN THE STATE I.E PERFORM SOME ACTION HERE THE NAVIGATION
        body: BlocListener(
      bloc: loginRegisterBloc,
      listener: (context, state) {
        ///NAVIGATE TO HOMESCREEN
        if (state is LoginWithDataButtonNavigateState) {
          log("In LoginWithData to home");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const NavbarScreen()));
        }

        ///NAVIGATE TO REGISTERSCREEN
        else if (state is RegisterButtonNavigateState) {
          log("In Login to Register");

          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const RegisterScreen()));
        }
      },
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/image.png",
                    height: 150,
                    width: 150,
                  ),
                ),
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
                            textcontroller: _emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextfield(
                            title: "Password",
                            textcontroller: _passwordController,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              ///ADDING LoginWithDataButtonNavigateEvent TO LOGINREGISTERBLOC

                              loginRegisterBloc.add(
                                  LoginWithDataButtonNavigateEvent(
                                      userCredential: {
                                    "email": _emailController.text,
                                    "password": _passwordController.text,
                                  }));
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
                    ///ADDING RegisterButtonNavigateEvent TO LOGINREGISTERBLOC
                    loginRegisterBloc.add(RegisterButtonNavigateEvent());
                  },
                  child: const BottomLineButton(
                      content: "Don’t have an account? ", title: "Sign up"),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
