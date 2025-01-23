// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:grocery_bloc_app/controller/Data/grocery_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:grocery_bloc_app/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCy8EyaoL0QqzRvg4_ikC0N9_teTEKJbaQ",
        appId: "1:230809085504:android:acc1592c128ab7978421a5",
        messagingSenderId: "230809085504",
        projectId: "grocery-app-e2c5d"),
  );
  runApp(const MainApp());
  // for (var data in GroceryData.groceryProducts) {
  //   await FirebaseFirestore.instance
  //       .collection("Grocery")
  //       .doc(data["category"])
  //       .set({"category": data["category"]});
  //   for (var d in data['itemList']) {
  //     await FirebaseFirestore.instance
  //         .collection("Grocery")
  //         .doc(data["category"])
  //         .collection("itemList")
  //         .add(d);
  //   }
  // }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
