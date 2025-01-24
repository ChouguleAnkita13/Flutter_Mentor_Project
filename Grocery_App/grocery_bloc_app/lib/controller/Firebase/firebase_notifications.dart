import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_order_data.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';
import 'package:grocery_bloc_app/model/notification_model.dart';

class FirebaseNotifications {
  static List<NotificationModel> notificationList = [];

  ///FIREBASE DOCUMENT INSTANCE
  static DocumentReference<Map<String, dynamic>> docInstance =
      FirebaseFirestore.instance.collection("Users").doc(SessionData.email);

  ///FETCH ALL NOTIFICATION FROM FIREBASE
  static Future<void> getNotificationListFromFirebase() async {
    DocumentSnapshot userDoc = await docInstance.get();

    notificationList = List.generate(
        userDoc['notificationList'].length,
        (i) => NotificationModel(
            orderId: userDoc['notificationList'][i]['orderId'],
            message: userDoc['notificationList'][i]['message'],
            date: userDoc['notificationList'][i]['date'],
            time: userDoc['notificationList'][i]['time'])).reversed.toList();
    // log("${userDoc['notificationList']}");
  }

  ///Remove Notification from screen
  static Future<void> removeNotificationFromFirebase(
      NotificationModel notification) async {
    ///GET LIST OF ORDERID AND NOTIFICTAIONS
    await FirebaseOrderData.getOrderIdListFromFirebase();

    ///
    FirebaseOrderData.notificationListOfMap
        .removeWhere((note) => note['time'] == notification.time);

    ///REMOVE NOTIFICATION FROM LOCAL LIST
    notificationList.remove(notification);

    ///ALSO UPDATE FIREBASE NOTIFICATIONLIST FROM USER COLLECTION

    await docInstance
        .update({'notificationList': FirebaseOrderData.notificationListOfMap});
  }
}
