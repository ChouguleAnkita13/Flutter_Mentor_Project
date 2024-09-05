import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controller/controller_binding.dart';
import 'package:wallet_app/controller/getpages_controller.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: ControllerBinding(),
      getPages: GetpagesController.getPagesList,
      debugShowCheckedModeBanner: false,
    );
  }
}
