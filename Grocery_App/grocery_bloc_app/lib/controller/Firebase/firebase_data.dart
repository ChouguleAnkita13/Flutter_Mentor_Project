import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';

class FirebaseData {
  static FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  static List<ProductDataModel> groceryProduct = [];

  ///
  static Future<void> createUserAccount(
      Map<String, dynamic> userCredential) async {
    try {
      ///FIREBASE AUTHENTICATION FOR CREATE USER/SIGN UP WITH USER AND PASSWORD

      UserCredential userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userCredential["email"],
              password: userCredential["password"]);

      ///ADDING USERS DATA TO FIRESTORE DATABASE
      await firebaseInstance.collection("Users").add(userCredential);

      log("$userCredentials");
    } on FirebaseAuthException catch (e) {
      log(e.code);
    }
  }

  ///
  static Future<void> signUserAccount(Map userCredential) async {
    try {
      ///FIREBASE AUTHENTICATION FOR SIGN IN WITH USER AND PASSWORD
      UserCredential userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userCredential["email"],
              password: userCredential["password"]);

      ///FETCHING USERS DATA FROM FIRESTORE DATABASE
      QuerySnapshot response = await firebaseInstance.collection("Users").get();

      ///TO GET USER DATA
      for (var data in response.docs) {
        if (data["email"] == userCredential["email"]) {
          ///STORING THE EXACT USER DATA TO SHAREDPREFERENCE DATABASE
          await SessionData.storeSessiondata(
              isLogin: true, email: data["email"], username: data["username"]);
          break;
        }
      }

      log("$userCredentials");
    } on FirebaseAuthException catch (e) {
      log(e.code);
    }
  }

  ///FETCHING GROCERYS FROM FIREBASE
  static Future<void> getGroceryDataFromFirebase() async {
    QuerySnapshot response = await firebaseInstance.collection("Grocery").get();

    /// GET GROCERY DATA
    for (var e in response.docs) {
      groceryProduct.add(ProductDataModel(
          id: e['id'],
          name: e['name'],
          description: e['description'],
          price: e['price'],
          imageUrl: e['imageUrl']));
    }
  }
}
