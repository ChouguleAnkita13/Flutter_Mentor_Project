import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/device_operator.dart';
import 'package:smart_home_app/controller/room_controller.dart';
import 'package:smart_home_app/view/DeviceDetailsScreen/device_details_screen.dart';
import 'package:smart_home_app/view/HomeScreen/home_screen.dart';
import 'package:smart_home_app/view/RoomDetailsScreen/room_details_screen.dart';

/// THE ENTRY POINT OF THE APPLICATION.
void main() {
  runApp(const MainApp());
}

///MAINAPP USES MULTIPROVIDER TO MANAGE MULTIPLE PROVIDERS FOR STATE MANAGEMENT.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// MULTIPROVIDER ALLOWS THE USE OF MULTIPLE CHANGENOTIFIERPROVIDERS IN ONE PLACE.
      providers: [
        /// ROOMCONTROLLER PROVIDER TO MANAGE THE STATE OF ROOMS IN THE SMART HOME.
        ChangeNotifierProvider(create: (context) => RoomController()),

        /// DEVICEOPERATOR PROVIDER TO MANAGE THE STATE OF DEVICES TO OPERATOR.
        ChangeNotifierProvider(create: (context) => DeviceOperator()),
      ],
      child: MaterialApp(
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,

        /// NAMED ROUTES TO NAVIGATE THROUGH DIFFERENT SCREENS IN THE APP.
        routes: {
          "home": (context) => const HomeScreen(),
          "roomdetails": (context) => const RoomDetailsScreen(),
          "devicedetails": (context) => const DeviceDetailsScreen(),
        },
      ),
    );
  }
}
