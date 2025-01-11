import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/bottom_line_button.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/custom_textfield.dart';
import 'package:grocery_bloc_app/view/Widgets/button_container.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_snackbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRegisterBloc = LoginRegisterBloc();

    return Scaffold(
        backgroundColor: Colors.white,

        //BLOC LISTERNER USED TO ONLY LISTEN THE STATE I.E PERFORM SOME ACTION HERE THE NAVIGATION
        body: BlocListener(
            bloc: loginRegisterBloc,
            listener: (context, state) {
              ///NAVIGATE TO LOGIN SCREEN
              if (state is LoginButtonNavigateState) {
                log("In Register to login");
                Navigator.of(context).pop();
              } else if (state is LoginRegisterWithDataButtonErrorState) {
                CustomSnackbar.customSnackbar(context, state.error);
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
                                      textcontroller:
                                          loginRegisterBloc.usernameController),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextfield(
                                      title: "Email",
                                      textcontroller:
                                          loginRegisterBloc.emailController),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextfield(
                                      title: "Password",
                                      textcontroller:
                                          loginRegisterBloc.passwordController),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      ///ADDING RegisterWithDataButtonNavigateEvent TO LOGINREGISTERBLOC
                                      loginRegisterBloc.add(
                                          RegisterWithDataButtonNavigateEvent(
                                              userCredential: {
                                            "email": loginRegisterBloc
                                                .emailController.text,
                                            "password": loginRegisterBloc
                                                .passwordController.text,
                                            "username": loginRegisterBloc
                                                .usernameController.text,
                                            "address": "",
                                            "fevList": [],
                                            'cartList': [],
                                            'ordersList': []
                                          }));
                                    },
                                    child:
                                        const ButtonContainer(title: "Sign Up"),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      // const Spacer(),
                      GestureDetector(
                        onTap: () {
                          ///ADDING LoginButtonNavigateEvent TO LOGINREGISTERBLOC
                          loginRegisterBloc.add(LoginButtonNavigateEvent());
                        },
                        child: const BottomLineButton(
                            content: "Already have an account? ",
                            title: "Sign In"),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
