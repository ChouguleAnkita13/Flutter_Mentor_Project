import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controller/controller_binding.dart';
import 'package:wallet_app/controller/getpages_controller.dart';

/// MAIN FUNCTION - ENTRY POINT OF THE APPLICATION
void main() {
  runApp(const MainApp());
}

/// MAIN APPLICATION WIDGET
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// SETTING THE INITIAL ROUTE OF THE APP
      initialRoute: "/",

      /// BINDING ALL NECESSARY CONTROLLERS WHEN THE APP STARTS
      initialBinding: ControllerBinding(),

      /// REGISTERING ALL APPLICATION ROUTES AND THEIR ASSOCIATED SCREENS
      getPages: GetpagesController.getPagesList,

      /// DISABLE DEBUG BANNER IN THE TOP RIGHT CORNER
      debugShowCheckedModeBanner: false,
    );
  }
}
