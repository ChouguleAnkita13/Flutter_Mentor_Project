import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controller/controller_binding.dart';
import 'package:wallet_app/view/HistoryScreen/history_screen.dart';
import 'package:wallet_app/view/HomeScreen/home_screen.dart';
import 'package:wallet_app/view/LoginScreen/create_account_screen.dart';
import 'package:wallet_app/view/LoginScreen/login_screen.dart';
import 'package:wallet_app/view/LoginScreen/otp_screen.dart';
import 'package:wallet_app/view/LoginScreen/password_screen.dart';
import 'package:wallet_app/view/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding:ControllerBinding() ,
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/password", page: () => const PasswordScreen()),
        GetPage(name: "/createAc", page: () => const CreateAccountScreen()),
        GetPage(name: "/otpScreen", page: () => const OTPScreen()),
        GetPage(name: "/home", page: () => const HomeScreen()),
        GetPage(name: "/history", page: () => const HistoryScreen()),


      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
