import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';
import 'package:grocery_bloc_app/view/LoginRegister/login_screen.dart';
import 'package:grocery_bloc_app/view/navbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginRegisterBloc loginRegisterBloc = LoginRegisterBloc();
  @override
  void initState() {
    loginRegisterBloc.add(LoginButtonNavigateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("Here in build");

    return Scaffold(
        backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
        body: BlocListener(
            bloc: loginRegisterBloc,
            listener: (context, state) async {
              log("BlocListener");
              if (state is LoginButtonNavigateState) {
                SessionData.getSessiondata();
                await Future.delayed(const Duration(seconds: 3), () {
                  log("${SessionData.isLogin}");

                  ///CHECK USER IS ALREADY LOGGED IN
                  ///IF YES NAVIGATE TO HOMESCREEN ELSE LOGINSCREEN
                  if (SessionData.isLogin!) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const NavbarScreen()));
                  } else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  }
                });
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/image.png",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Text(
                    "Grocery",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 40,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
