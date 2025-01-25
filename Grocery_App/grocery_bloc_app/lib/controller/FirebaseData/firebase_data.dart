import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_bloc_app/controller/FirebaseData/firebase_addtocart_data.dart';
import 'package:grocery_bloc_app/controller/FirebaseData/firebase_wishlist_data.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernceData/session_data.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';

class FirebaseData {
  static FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  static List<ProductModel> groceryProduct = [];
  static List<ProductDataModel> itemList = [];

  ///
  static Future<String> createUserAccount(
      Map<String, dynamic> userCredential) async {
    try {
      ///FIREBASE AUTHENTICATION FOR CREATE USER/SIGN UP WITH USER AND PASSWORD

      UserCredential userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userCredential["email"],
              password: userCredential["password"]);

      ///ADDING USERS DATA TO FIRESTORE DATABASE
      await firebaseInstance
          .collection("Users")
          .doc(userCredential["email"])
          .set(userCredential);

      log("$userCredentials");
      return "true";
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return e.code;
    }
  }

  ///
  static Future<String> signUserAccount(Map userCredential) async {
    try {
      ///FIREBASE AUTHENTICATION FOR SIGN IN WITH USER AND PASSWORD
      UserCredential userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userCredential["email"],
              password: userCredential["password"]);

      ///FETCHING USERS DATA FROM FIRESTORE DATABASE
      QuerySnapshot response = await firebaseInstance.collection("Users").get();
      bool isUserPresent = false;

      ///TO GET USER DATA
      for (var data in response.docs) {
        if (data["email"] == userCredential["email"]) {
          ///STORING THE EXACT USER DATA TO SHAREDPREFERENCE DATABASE
          await SessionData.storeSessiondata(
              isLogin: true, email: data["email"], username: data["username"]);
          await SessionData.storeSessionAddress(address: data["address"]);
          isUserPresent = true;
          break;
        }
      }

      if (!isUserPresent) {
        log("No User Present");
        throw Exception("No User Present");
      }
      log("$userCredentials");
      return "true";
    } on FirebaseAuthException catch (e) {
      log(e.code);

      return e.code;
    } catch (error) {
      return error.toString();
    }
  }

  ///UPDATE DELIVERY ADDRESS
  static Future<void> updateAddressFromFirebase(String address) async {
    await firebaseInstance
        .collection("Users")
        .doc(SessionData.email)
        .update({"address": address});
    await SessionData.storeSessionAddress(address: address);
  }

  ///UPDATE DELIVERY ADDRESS
  static Future<void> updateUsernameFromFirebase(String username) async {
    await firebaseInstance
        .collection("Users")
        .doc(SessionData.email)
        .update({"username": username});

    await SessionData.storeSessiondata(
        isLogin: SessionData.isLogin!,
        email: SessionData.email!,
        username: username);
  }

  ///Logout
  static Future<void> logoutFromFirebase() async {
    await FirebaseAuth.instance.signOut();
    await SessionData.storeSessiondata(isLogin: false, email: "", username: "");
    await SessionData.storeSessionAddress(address: "");
  }

  ///FETCHING GROCERYS FROM FIREBASE
  static Future<void> getGroceryDataFromFirebase() async {
    QuerySnapshot response = await firebaseInstance.collection("Grocery").get();

    /// GET FEVIDLIST
    await FirebaseWishlistData.getFevIdListFromFirebase();

    ///GET ADDTOCARTIDLIST
    await FirebaseAddtocartData.getCartIdListFromFirebase();

    ///CLEAR LIST
    groceryProduct.clear();

    /// GET GROCERY DATA
    for (var e in response.docs) {
      QuerySnapshot res = await firebaseInstance
          .collection("Grocery")
          .doc(e.id)
          .collection("itemList")
          .get();

      for (var d in res.docs) {
        // log(e.id);
        itemList.add(ProductDataModel(
            id: d.id,
            category: e.id,
            isFev: FirebaseWishlistData.fevIdList.contains(d.id),
            isAddToCart: FirebaseAddtocartData.addToCartIdList.contains(d.id),
            name: d['name'],
            description: d['description'],
            numberOfItems: d['numberOfItems'],
            price: d['price'],
            quantity: d['quantity'],
            imageUrl: d['imageUrl']));
      }

      groceryProduct
          .add(ProductModel(category: e.id, itemList: itemList.toList()));
      itemList.clear();
    }
  }
}
