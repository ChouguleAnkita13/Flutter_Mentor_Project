import 'package:flutter/material.dart';
import 'package:get/get.dart';
///WIDGET TO DISPLAY SPLASHSCREEN
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1200),()=>Get.toNamed("/login"));
    return Scaffold(
      body: Image.asset(
        "assets/images/splash.png",height: Get.height,width: Get.width,fit: BoxFit.cover,
      ),
    );
}
}