import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';

class FirebaseAddtocartData {
  static List<ProductDataModel> cartItems = [];
  static FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  static List addToCartIdList = [];

  ///FUNCTION FOR GETTING ALL CART ITEM IDS WHICH= ARE IN USER COLLECTION
  static Future<void> getCartIdListFromFirebase() async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);
    DocumentSnapshot userDoc = await docInstance.get();

    addToCartIdList = userDoc['cartList'];
  }

  ///ADD ITEM ID TO CARTLIST WHICH IS USERS COLLECTION
  static Future<bool> addAndRemoveProductToFirebaseCartList(
      ProductDataModel product) async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);

    /// GET CARTIDLIST

    await getCartIdListFromFirebase();

    ///IF THE CARTIDLIST CONTAINS THE PRODUCT ID WHICH WE WANT TO ADD
    ///THEN IT WILL NOT ADD THE ID TO CARTIDLIST
    ///IF NOT CONTAINS THEN IT WILL ADD
    if (addToCartIdList.contains(product.id)) {
      await removeDataFromFirebaseCartList(product);
      return false;
    } else {
      addToCartIdList.add(product.id);
      docInstance.update({'cartList': addToCartIdList});
      return true;
    }
  }

  ///FETCHING CARTLIST FROM FIREBASE
  static Future<void> getCartListFromFirebase() async {
    QuerySnapshot response = await firebaseInstance.collection("Grocery").get();

    /// GET CARTIDLIST

    await getCartIdListFromFirebase();
    cartItems.clear();

    ///GET ALL PRODUCTS WHOSE ID IS PRESENT IN CARTLIST OF USERS COLLECTION IN USER DOCUMENT
    for (var e in response.docs) {
      QuerySnapshot res = await firebaseInstance
          .collection("Grocery")
          .doc(e.id)
          .collection("itemList")
          .get();

      for (var d in res.docs) {
        ///IF PRODUCT ID IS IN CARTIDLIST THEN RETURN TRUE
        if (addToCartIdList.contains(d.id)) {
          // log(e.id);
          cartItems.add(ProductDataModel(
              id: d.id,
              category: e.id,
              isFev: true,
              isAddToCart: true,
              name: d['name'],
              description: d['description'],
              price: d['price'],
              quantity: d['quantity'],
              numberOfItems: d['numberOfItems'],
              imageUrl: d['imageUrl']));
        }
      }
    }
  }

  ///REMOVE ITEM FROM FIREBASE CARTLIST
  static Future<bool> removeDataFromFirebaseCartList(
      ProductDataModel product) async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);

    /// GET CARTIDLIST

    await getCartIdListFromFirebase();

    ///IF THE CARTIDLIST CONTAINS THE PRODUCT ID WHICH WE WANT TO REMOVE
    ///THEN ONLY IT WILL REMOVE THE ID FROM CARTIDLIST AND UPDATE THE CARTIDLIST OF USER DOCUMENT
    ///ALSO REMOVE PRODUCT FROM LOCAL LIST
    ///

    if (addToCartIdList.contains(product.id)) {
      addToCartIdList.remove(product.id);
      cartItems.remove(product);
      docInstance.update({'cartList': addToCartIdList});
      return true;
    } else {
      return false;
    }
  }

  ///Add ITEM TO FIREBASE

  static Future<bool> addDataToFirebaseCartList(
      ProductDataModel product) async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);

    /// GET CARTIDLIST
    await getCartIdListFromFirebase();

    ///IF THE CARTIDLIST NOT CONTAINS THE PRODUCT ID WHICH WE WANT TO ADD
    ///THEN ONLY IT WILL ADD THE ID IN CARTIDLIST AND UPDATE THE CARTIDLIST OF USER DOCUMENT
    ///

    if (!addToCartIdList.contains(product.id)) {
      addToCartIdList.add(product.id);
      docInstance.update({'cartList': addToCartIdList});
      return true;
    } else {
      return false;
    }
  }

  ///ADD ALL WISHLIST ITEMS ID TO CARTLIST
  ///IF ALL ARE ALREADY PRESENT IT WILL NOT ADDED THE ID IN CARTLIST
  ///IF MORE THAN 0 OF THE IDS ARE NOT PRESENT THEN IT WILL ADD IN CARTLIST
  static Future<bool> addWishListToFirebaseCartList(
      List<ProductDataModel> wishlistItems) async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);
    List idList = [];

    /// GET CARTIDLIST
    await getCartIdListFromFirebase();

    for (var item in wishlistItems) {
      if (!addToCartIdList.contains(item.id)) {
        idList.add(item.id);
      }
    }
    if (idList.isNotEmpty) {
      addToCartIdList = addToCartIdList + idList;
      docInstance.update({'cartList': addToCartIdList});
      return true;
    } else {
      return false;
    }
  }
}
