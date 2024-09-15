import 'package:flutter/material.dart';
import 'package:get/get.dart';

///WIDGET TO DISPLAY SPLASHSCREEN
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    ///REDIRECT TO LOGIN SCREEN AFTER 1200 MILLISECONDS
    Future.delayed(
      const Duration(milliseconds: 1200),
      () => Get.offAndToNamed("/login"), ///NAVIGATES AND CLEARS SPLASH SCREEN FROM STACK
    );
    
    return Scaffold(
      
      ///FULLSCREEN IMAGE AS BACKGROUND FOR SPLASHSCREEN
      body: Image.asset(
        "assets/images/splash.png",
        height: Get.height,
        width: Get.width,
        fit: BoxFit.cover,  
      ),
    );
  }
}
