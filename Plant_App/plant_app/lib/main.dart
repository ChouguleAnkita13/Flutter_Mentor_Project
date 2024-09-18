import 'package:flutter/material.dart';
import 'package:plant_app/controller/otp_controller.dart';
import 'package:plant_app/controller/plant_controller.dart';
import 'package:provider/provider.dart';
import 'package:plant_app/view/get_started_screen.dart';

/// MAIN FUNCTION - ENTRY POINT OF THE APP
void main() {
  /// CALLS THE RUNAPP FUNCTION TO START THE FLUTTER APPLICATION
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// MULTIPROVIDER USED TO INJECT MULTIPLE PROVIDERS INTO THE WIDGET TREE
      providers: [
        /// PROVIDING PLANTCONTROLLER TO THE WIDGET TREE
        ChangeNotifierProvider(
          create: (context) => PlantController(),
        ),

        /// PROVIDING OTPCONTROLLER TO THE WIDGET TREE
        ChangeNotifierProvider(
          create: (context) => OTPController(),
        ),
      ],

      child: const MaterialApp(
        /// INITIAL SCREEN FOR THE APP
        home: GetStarted(),

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
