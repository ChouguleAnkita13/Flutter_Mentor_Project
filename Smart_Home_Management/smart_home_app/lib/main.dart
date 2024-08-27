import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/room_controller.dart';
import 'package:smart_home_app/view/HomeScreen/home_screen.dart';
import 'package:smart_home_app/view/RoomDetails/room_details_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>RoomController(), //Provider
      child:  MaterialApp(
        home:const HomeScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          "roomdetails":(context)=>const RoomDetailsScreen(),
        },
      ),
    );
  }
}
