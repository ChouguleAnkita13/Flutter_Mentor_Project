import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_event.dart';

class DisplayUsernameTextfield extends StatelessWidget {
  const DisplayUsernameTextfield({super.key, required this.loginRegisterBloc});
  final LoginRegisterBloc loginRegisterBloc;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginRegisterBloc.usernameController,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: const InputDecoration(border: InputBorder.none),
      onFieldSubmitted: (value) {
        loginRegisterBloc
            .add(UpdateUsernameOnFieldSubmittedEvent(username: value));
      },
    );
  }
}
