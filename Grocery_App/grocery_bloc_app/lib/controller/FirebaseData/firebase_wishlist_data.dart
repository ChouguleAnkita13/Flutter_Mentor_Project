import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernceData/session_data.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';

class FirebaseWishlistData {
  static List<ProductDataModel> wishlistItems = [];
  static FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  static List fevIdList = [];

  ///FUNCTION FOR GETTING ALL FEVORITE ITEM IDS WHICH ARE IN USER COLLECTION
  static Future<void> getFevIdListFromFirebase() async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);
    DocumentSnapshot userDoc = await docInstance.get();

    fevIdList = userDoc['fevList'];
  }

  ///ADD ITEM ID TO FEVLIST WHICH IS USERS COLLECTION
  static Future<bool> addAndRemoveProductToFirebaseWishList(
      ProductDataModel product) async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);

    await getFevIdListFromFirebase();

    ///IF THE FEVIDLIST CONTAINS THE PRODUCT ID WHICH WE WANT TO ADD
    ///THEN IT WILL NOT ADD THE ID TO FEVIDLIST
    ///IF NOT CONTAINS THEN IT WILL ADD
    if (fevIdList.contains(product.id)) {
      await removeDataFromFirebaseWishList(product);
      return false;
    } else {
      fevIdList.add(product.id);
      docInstance.update({'fevList': fevIdList});
      return true;
    }
  }

  ///FETCHING WISHLIST FROM FIREBASE
  static Future<void> getWishlistFromFirebase() async {
    QuerySnapshot response = await firebaseInstance.collection("Grocery").get();

    /// GET FEVIDLIST

    await getFevIdListFromFirebase();
    wishlistItems.clear();

    ///GET ALL PRODUCTS WHOSE ID IS PRESENT IN FEVLIST OF USERS COLLECTION IN USER DOCUMENT
    for (var e in response.docs) {
      QuerySnapshot res = await firebaseInstance
          .collection("Grocery")
          .doc(e.id)
          .collection("itemList")
          .get();

      for (var d in res.docs) {
        ///IF PRODUCT ID IS IN FEVIDLIST THEN RETURN TRUE
        if (fevIdList.contains(d.id)) {
          // log(e.id);
          wishlistItems.add(ProductDataModel(
              id: d.id,
              category: e.id,
              isFev: true,
              isAddToCart: false,
              name: d['name'],
              description: d['description'],
              price: d['price'],
              numberOfItems: d['numberOfItems'],
              quantity: d['quantity'],
              imageUrl: d['imageUrl']));
        }
      }
    }
  }

  ///REMOVE ITEM FROM FIREBASE WISHLIST
  static Future<bool> removeDataFromFirebaseWishList(
      ProductDataModel product) async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);

    /// GET FEVIDLIST
    await getFevIdListFromFirebase();

    ///IF THE FEVIDLIST CONTAINS THE PRODUCT ID WHICH WE WANT TO REMOVE
    ///THEN ONLY IT WILL REMOVE THE ID FROM FEVIDLIST AND UPDATE THE FEVLIST OF USER DOCUMENT
    ///ALSO REMOVE PRODUCT FROM LOCAL LIST
    if (fevIdList.contains(product.id)) {
      fevIdList.remove(product.id);
      wishlistItems.remove(product);
      docInstance.update({'fevList': fevIdList});
      return true;
    } else {
      return false;
    }
  }
}
