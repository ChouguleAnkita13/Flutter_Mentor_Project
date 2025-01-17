import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';
import 'package:grocery_bloc_app/model/order_details_model.dart';
import 'package:grocery_bloc_app/model/product_data_model.dart';
import 'package:intl/intl.dart';

class FirebaseOrderData {
  static FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  static List orderIdList = [];
  static List<OrderDetails> ordersList = [];

  ///FUNCTION FOR GETTING ALL ORDERS IDS WHICH ARE IN USER COLLECTION
  static Future<void> getOrderIdListFromFirebase() async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);
    DocumentSnapshot userDoc = await docInstance.get();

    orderIdList = userDoc['ordersList'];
  }

  static Future<bool> addOrderToFirebase(Map<String, dynamic> orderMap) async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);

    ///  [await firebaseInstance.collection("Orders").add(orderMap)] THIS LINE RETURNS THE ID OF DOCUMENT
    /// WHERE IT STORED
    ///
    DocumentReference docId =
        await firebaseInstance.collection("Orders").add(orderMap);

    ///GET LIST OF ORDERID
    await getOrderIdListFromFirebase();

    ///[docId] CONTAINES PATH OF ID FORM IT'S COLLECTIONS I.E /ORDERS/VHGHGJHGID
    ///TO GET ONLY PERTICULAR ID WITHOUT COLLECTION NAME,USED [docId.id]
    ///IT GIVES E.G "VHGHGJHGID"
    orderIdList.add(docId.id);

    ///UPDATING USERS COLLECTION BY ADDING ORDERID IN ORDERLIST
    ///AND REMOVING ALL CARTID'S FROM CARTLIST
    docInstance.update({'ordersList': orderIdList, 'cartList': []});

    return false;
  }

  ///FETCHING CARTLIST FROM FIREBASE
  static Future<void> getOrderListFromFirebase() async {
    QuerySnapshot response = await firebaseInstance.collection("Orders").get();

    /// GET OORDERIDLIST
    await getOrderIdListFromFirebase();
    ordersList.clear();

    ///GET ALL ORDERS WHOSE ID IS PRESENT IN ORDERLIST OF USERS COLLECTION IN USER DOCUMENT
    List<ProductDataModel> itemList = [];

    for (var data in response.docs) {
      if (orderIdList.contains(data.id)) {
        ///
        itemList = List.generate(
            data['orderItemList'].length,
            (index) => ProductDataModel(
                id: data['orderItemList'][index]['id'],
                name: data['orderItemList'][index]['name'],
                isFev: data['orderItemList'][index]['isFev'],
                isAddToCart: data['orderItemList'][index]['isAddToCart'],
                category: data['orderItemList'][index]['category'],
                description: data['orderItemList'][index]['description'],
                price: data['orderItemList'][index]['price'],
                imageUrl: data['orderItemList'][index]['imageUrl'],
                numberOfItems: data['orderItemList'][index]['numberOfItems'],
                quantity: data['orderItemList'][index]['quantity']));

        /// PARSE ORDERPLACED TIME
        DateTime orderPlacedTime = DateTime.parse(data['orderPlacedTime']);
        // DateFormat('d MMM yyyy,h:mm a').parse('16 Jan 2025,12:49 PM');
        ///FORMAT ORDERPLACED TIME
        String orderTime =
            DateFormat('d MMM yyyy,h:mm a').format(orderPlacedTime);
        DateTime now = DateTime.now();

        /// CALCULATE DELIVERY STATUS BASED ON TIME ELAPSED
        String status;
        Duration timeElapsed = now.difference(orderPlacedTime);
        if (timeElapsed.inMinutes < 2) {
          status = "Active";
        } else if (timeElapsed.inMinutes < 5) {
          status = "Being Packed";
        } else if (timeElapsed.inMinutes < 10) {
          status = "Out for Delivery";
        } else if (timeElapsed.inMinutes >= 10) {
          status = "Delivered";
        } else {
          status = "";
        }

        /// UPDATE STATUS IN FIREBASE
        await firebaseInstance.collection("Orders").doc(data.id).update({
          'status': status,
        });

        ///
        OrderDetails orderDetailObj = OrderDetails(
            id: data.id,
            dateTime: data['deliveryTime'],
            orderPlacedTime: orderTime,
            status: status,
            deliveryAddress: data['deliveryAddress'],
            paymentMethod: data['paymentMethod'],
            totalAmount: data['totalAmount'],
            items: itemList);

        ///ADD IN LIST
        ordersList.add(orderDetailObj);
      }
    }
  }
}
